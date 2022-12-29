require 'yaml'
MESSAGES = YAML.load_file('mortgage_calc_messages.yml')

# Define methods
def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input && input.to_i > 0
end

def float?(input)
  input.to_f.to_s == input && input.to_f > 0.0
end

def valid_num?(input)
  integer?(input) || float?(input)
end

def calculate_monthly_payment(amount, interest, duration)
  amount.to_f() * (interest / (1 - (1 + interest)**(-duration)))
end

def display_welcome_prompt
  prompt(MESSAGES['welcome'])
  sleep(1)
  system('clear')
end

def display_goodbye_prompt
  prompt(MESSAGES['goodbye'])
  sleep(0.75)
  prompt("Closing Mortgage Calculator...")
  sleep(2)
  system('clear')
end

def clear_calc_input
  sleep(0.75)
  system('clear')
end

# Main program
display_welcome_prompt

loop do
  prompt(MESSAGES['prompt_input'])
  sleep(1)
  loan_amount = ''
  loop do
    prompt("Loan Amount: ")
    loan_amount = Kernel.gets().chomp()
    loan_amount.delete!(',') if loan_amount.include?(',')
    if valid_num?(loan_amount)
      break
    else
      prompt(MESSAGES['valid_input'])
    end
  end
  clear_calc_input

  prompt(MESSAGES['prompt_input'])
  sleep(1)
  prompt(MESSAGES['interest_rate'])
  apr = ''
  loop do
    apr = Kernel.gets().chomp()
    if valid_num?(apr)
      break
    else
      prompt(MESSAGES['valid_input'])
    end
  end
  monthly_rate = (apr.to_f / 100) / 12
  clear_calc_input

  prompt(MESSAGES['prompt_input'])
  sleep(1)
  prompt("Loan Term in Years:")
  years = ''
  loop do
    years = Kernel.gets().chomp()
    if valid_num?(years)
      break
    else
      prompt(MESSAGES['valid_input'])
    end
  end
  months = years.to_f() * 12
  clear_calc_input

  result = calculate_monthly_payment(loan_amount, monthly_rate, months)
  prompt("Amount due each month: $#{result.round(2)}")
  sleep(1)
  answer = ''
  loop do
    prompt(MESSAGES['continue'])
    answer = Kernel.gets().chomp().downcase()
    if answer == 'y'
      prompt("Resetting Mortgage Calculator...")
      sleep(2)
      system('clear')
      break
    elsif answer == 'n'
      break
    else
      prompt(MESSAGES['valid_input'])
      clear_calc_input
    end
  end
  break if answer == 'n'
end

display_goodbye_prompt
