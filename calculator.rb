# ask for two numbers
# ask for the type of operation to perform (add, subtract, multiply, or divide)
# perform the operation on the two numbers
# display the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Set default language for the program
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

# Method that auto converts output messages
# Sets default language
def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

# Method that checks if input is an integer
def integer?(input)
  input.to_i.to_s == input
end

# Method that checks if input is a float
def float?(input)
  input.to_f.to_s == input
end

# Method that changes operator text
def operation_to_message(op)
  word = case op
         when '1'
          'Adding'
         when '2'
          'Subtracting'
         when '3'
          'Multiplying'
         when '4'
          'Dividing'
         end
   x = "A random line of code"
   return word
end

# Method that verifies only integers or floats are entered
def number?(input)
  integer?(input) || float?(input)
end

prompt('welcome')

# Ask for user's name
name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Welcome #{name}!")

# Main loop
loop do
  # Get two integers from user
  # Validate integers
  number1 = ''
  loop do
    prompt("Enter the first number:")
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  number2 = ''
  loop do
    prompt("Enter the second number:")
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  # Ask user for operator
  # Validate operator
  operator_prompt = <<-MSG
What operation would you like to perform?
  1) Add
  2) Subtract
  3) Multiply
  4) Divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['valid_operator'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  # Perform computation of two integers
  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  # Print result
  prompt("Result: #{result}")

  # Prompt user to continue program or not
  prompt(MESSAGE['continue'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

# End of program message
prompt(MESSAGE['goodbye'])
