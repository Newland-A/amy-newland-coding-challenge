#!/usr/bin/env ruby
# What to do
#   create command line tooll
#     take users input
#     store input
#     return that users input
#     key what user wants to stores
#     puts keys value
#     gets
#     if key is already found
#       output discards old value and store new value
#     if vlaue is not found
#       out Value not found
#     If comamnd exit return bye
#   if any other command than puts fetch exit
#   returns "Unknown command. Known commands are: put, fetch, exit".
#   users_input = Hash.new()
# loop do
#   puts ">"
#   input = gets
#   hash = Hash.new()

#   a, b, c = input.split(" ")
#   case a
#   when "put" # set a varible
#     command_entered = a
#       hash[b] = c
#     puts command_entered
#     puts hash
#   when "fetch"
#     puts hash[b]
#   when "exit"
#     puts "Bye"
#     exit
#   end
# end
# if already exists replace
  # puts a command
    # put store, replace,
    # fetch given vlaue
    # print invalid command or exit "Bye"
  # puts b first word
    # store as hash key
  # puts c  second word
    # store as value
# end



# COMPLETED VERSION
new_relic_store = {}

loop do
  print "> "
  input = gets.split(" ")

  command = input[0]

  case command
  when "put"
    key = input[1]
    value = input[2]

    if key && value
      new_relic_store[key] = value
      puts "ok"
    else
      puts "Invalid syntax."
    end

  when "fetch"
    key = input[1]

    if key && new_relic_store[key]
      puts new_relic_store[key]
    else
      puts "Value not found."
    end

  when "exit"
    puts "Bye!"
    exit

  else
    puts "Unknown command. Known commands are: put, fetch, exit"
  end
end
