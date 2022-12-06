# ask for two numbers
# ask for the type of operation to perform (add, subtract, multiply, or divide)
# perform the operation on the two numbers
# display the result

Kernel.puts("Welcome to Calculator!")

Kernel.puts("Enter the first number:")
number1 = Kernel.gets().chomp()

Kernel.puts("Enter the second number:")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform on the two numbers? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
else
  result = number1.to_f() / number2.to_f()
end

Kernel.puts("Result: #{result}")