# Calculator
# Explanation

# You will be building a calculator. A calculator can perform multiple arithmetic operations. Your function should allow the user to choose which operation is expected, enter in the values to perform the operation on, and ultimately view the result.
# Specification:

# A user should be given a menu of operations
# A user should be able to choose from the menu
# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
# This process should continue until the user selects a quit option from the menu
# Phase 1

# Calculator functionality
# Calculator should be able to do basic arithmetic (+,-, *, /)
# Phase 2

# Advanced Calculator functionality
# Calculator should be able to do basic arithmetic (exponents, square roots)
# Phase 3

# User should be given a menu of Calculator functionality
# User should be able to choose intended functionality
require 'rainbow'
require 'pry'

def main_menu
  puts "[q] - quit"
  puts "[a] - addition"
  puts "[s] - subtraction"
  puts "[x] - multiply"
  puts "[d] - divide"
  puts "[p] - power of"
  puts "[sq] - square root"
end

def fetch_input(prompt)
  print prompt
  gets.chomp # implicit return
end

def fetch_number(prompt)
  print prompt
  gets.to_f # floating input, allows decimal
end

def add(a, b)
  a + b
end

def subtract(a, b)
  b - a
end

def multiply(a, b)
  a * b
end

def divide(a, b)
  a / b
end

def pow_of(number, power)
  number ** power
end

def sqr_rt(num)
  Math.sqrt(num)
end

main_menu
user_choice = fetch_input "Please enter your selection: "

until user_choice == 'q'
 if user_choice == 'a'
  num1 = fetch_number "Your first number: "
  num2 = fetch_number "Your second number: "
  puts add(num1, num2)
 end
  if user_choice == 's'
    num1 = fetch_number "Your first number: "
    num2 = fetch_number "Your second number: "
    puts subtract(num1, num2)
  end
  if user_choice == 'x'
    num1 = fetch_number "Your first number: "
    num2 = fetch_number "Your second number: "
    puts multiply(num1, num2)
  end
  if user_choice == 'd'
    num1 = fetch_number "Your first number: "
    num2 = fetch_number "Your second number: "
    puts divide(num1, num2)
  end
  if user_choice == 'p'
    num1 = fetch_number "Your number: "
    num2 = fetch_number "To the power of: "
    puts pow_of(num1, num2)
  end
  if user_choice == 'sq'
    num1 = fetch_number "Number you want the square root of: "
    puts sqr_rt(num1)
  end



  main_menu
  user_choice = fetch_input "Please enter your selection: "
end


puts "Thanks for using the calculator!"




