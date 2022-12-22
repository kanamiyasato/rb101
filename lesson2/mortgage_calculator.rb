require 'yaml'
MESSAGES = YAML.load_file('mortgage_calc_messages.yml')

# Define methods
def prompt(message)
  Kernel.puts("=> #{message}")
end

def is_integer?(input)
  input.to_i.to_s == input && input.to_i > 0
end

def is_float?(input)
  input.to_f.to_s == input && input.to_f > 0.0
end

def valid_num?(input)
  is_integer?(input) || is_float?(input)
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
  sleep(0.75)
  system('clear')

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
  sleep(0.75)
  system('clear')

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
  sleep(0.75)
  system('clear')

  result = calculate_monthly_payment(loan_amount, monthly_rate, months)
  prompt("Amount due each month: $#{result.round(2)}")
  sleep(1)

  prompt(MESSAGES['continue'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
  prompt("Resetting Mortgage Calculator...")
  sleep(2)
  system('clear')
      
end

display_goodbye_prompt
