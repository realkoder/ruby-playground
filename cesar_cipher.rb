# frozen_string_literal: false

# This is not working
def cesar_cipher(string_value, shift_facor)
  fixed_shift_factor = shift_facor >= 26 ? shift_facor % 26 : shift_facor
  encrypted_string = ''
  string_value.each_byte do |char_byte|
    append_value = char_byte + fixed_shift_factor
    append_value -= 26 if append_value > 122
    append_value -= 26 if char_byte <= 90 && append_value > 90
    encrypted_string.concat(append_value)
  end
  encrypted_string.to_str
end

puts cesar_cipher('ABCDEF', 0)
