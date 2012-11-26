#!/usr/bin/env ruby
require 'benchmark' # to measure time calculations do take

# Finds the largest prime factor recursively.
# Search for a number mod of it equals to 0.
# Range from 2 to square root of a number +1. It makes calculation faster. We don't need to search trough all the numbers up to num
# as prime factor is always less than square root +1 OR the exact same number.
def max_prime_factor(num)
  return num if num == 1 || num < 1
  max_num = (num ** 0.5 + 1).to_i
  f = (2..max_num).find { |x| num % x == 0 } || num
  [f, max_prime_factor(num / f)].max
end

# Prompts to enter number
# type 'q' to exit the program
# prompts again if NaN entered
# Asks for confirmation in case of a large number (2 ** 64)
def prompt
  print 'Type an integer number (or q to exit) and press Enter: '
  number = gets
  say_bye_and_exit if number =~ /^q/i
  number = prompt unless number =~ /^\d+$/
  if number.to_i > 2 ** 64
    puts 'The number you entered is too big. Calculation can run a lot of time! Continue? (y/n)n'
    confirm = gets
    number = prompt unless confirm =~ /^y/i
  end
  number.to_i # to ensure Numeric value returs
end

# Greets 'Have a nice dat!' and exits the program
def say_bye_and_exit
  puts
  puts "\033[1m\033[34mHave a nice day!\033[0m"
  puts
  exit 0
end

# initial number from the Algorithmic task
number = 1876191413
# prompts to enter number, measure time calculation does take
# and shows the largest prime factor for the number
# until 'q' is entered
begin
  puts
  times = Benchmark.realtime { puts "The largest Prime Factor of \033[36m#{number}\033[0m is \033[32m\033[4m#{max_prime_factor(number)}\033[0m" }
  puts "calculated in (seconds): \033[40m\033[33m#{times}\033[0m"
  puts
end while number = prompt 

