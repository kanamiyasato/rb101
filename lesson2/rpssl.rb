require 'yaml'
MESSAGES = YAML.load_file('rpssl_messages.yml')

# Define hashes
ABBREVIATION = {
  'r' => 'rock',
  'p' => 'paper',
  's' => 'scissors',
  'k' => 'spock',
  'l' => 'lizard'
}

WINNING_MOVES = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['scissors', 'rock']
}

score = {
  player: 0,
  computer: 0
}

# Define methods
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_input?(choice)
  if ABBREVIATION.keys.include?(choice)
    ABBREVIATION.fetch(choice)
  end
end

def win?(first_choice, second_choice)
  WINNING_MOVES[first_choice].include?(second_choice)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("Player wins!")
  elsif win?(computer, player)
    prompt("Computer wins!")
  else
    prompt("It's a tie!")
  end
end

def keep_score(player, computer, score)
  if win?(player, computer)
    score[:player] += 1
  elsif win?(computer, player)
    score[:computer] += 1
  end
end

def grand_winner(score)
  if score[:player] == 3
    "Player is the grand winner!"
  elsif score[:computer] == 3
    "Computer is the grand winner!"
  end
end

def play_again(answer)
  if answer == 'y'
    prompt("Resetting game...")
    sleep(1.5)
    system('clear')
    true
  elsif answer == 'n'
    false
  else
    prompt("Invalid input.")
    sleep(0.75)
    system('clear')
    "invalid"
  end
end

def display_welcome_prompt
  prompt(MESSAGES['welcome'])
  sleep(1)
  system('clear')
end

def display_goodbye_prompt
  prompt(MESSAGES['goodbye'])
  sleep(0.75)
  prompt("Closing Game...")
  sleep(2)
  system('clear')
end

def invalid_input
  prompt(MESSAGES['valid_input'])
  sleep(0.75)
  system('clear')
end

def clear_prompt
  sleep(1.5)
  system('clear')
end

abbreviation_message = <<-MSG
Choose one of the following by typing:
  'r' for rock
  'p' for paper
  's' for scissors
  'k' for spock
  'l' for lizard
MSG

# Main program
display_welcome_prompt

loop do
  choice = ''
  computer_choice = ''
  loop do
    loop do
      prompt(abbreviation_message)
      choice = Kernel.gets().chomp()
      if valid_input?(choice)
        choice = valid_input?(choice)
        break
      else
        invalid_input
      end
    end
    clear_prompt

    computer_choice = ABBREVIATION.values.sample

    prompt("You entered #{choice}, Computer entered #{computer_choice}")
    clear_prompt

    display_results(choice, computer_choice)
    clear_prompt
    keep_score(choice, computer_choice, score)

    prompt("Current score:")
    score.each do |key, value|
      puts "#{key}: #{value}"
    end

    break if score[:player] == 3 || score[:computer] == 3
  end

  prompt(grand_winner(score))

  answer = ''
  loop do
    prompt(MESSAGES['play_again'])
    answer = Kernel.gets().chomp().downcase()
    play_again(answer)
    if play_again(answer) == true
      break
    elsif play_again(answer) == false
      break
    elsif play_again(answer) == "invalid"
      next
    end
  end
  break if play_again(answer) == false
end

display_goodbye_prompt
