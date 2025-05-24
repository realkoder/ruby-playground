# frozen_string_literal: true
# rubocop:disable Layout/EmptyLines



# =======
# LOOPS
# =======
loop do
  print 'Type something to get printed: '

  input = gets

  puts "U typed: #{input}"

  break if input.eql?("exit\n")

  begin
    is_input_number = Integer(input)
    puts "You provided a number: #{is_input_number}"
  rescue StandardError
    puts puts 'no number provided'
  end
end

# range loop
(1...4).each do |i|
  puts i
end

# Times loop
5.times do
  puts 'WOW'
end
