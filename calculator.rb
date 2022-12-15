# ask for two numbers
# ask for the type of operation to perform (add, subtract, multiply, or divide)
# perform the operation on the two numbers
# display the result

# Define methods
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name:")

# Ask for user's name
name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Please enter a valid name.")
  else
    break
  end
end

prompt("Hello #{name}!")

# Main loop
loop do
  # Get two integers from user
  # Validate integers
  number1 = ''
  loop do
    prompt("Enter the first number:")
    number1 = Kernel.gets().chomp()

    if valid_number(number1)
      break
    else
      prompt("Invalid number. Please try again.")
    end
  end

  number2 = ''
  loop do
    prompt("Enter the second number:")
    number2 = Kernel.gets().chomp()

    if valid_number(number2)
      break
    else
      prompt("Invalid number. Please try again.")
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
      prompt("Must choose 1, 2, 3, or 4.")
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
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

# End of program message
prompt("Thank you for using the calculator. Good bye!")
