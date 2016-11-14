# Implement a caesar cipher that takes in a string
# and the shift factor and then outputs the modified
# string

# a - z -> 97 - 122
# A - Z -> 65 - 90

def caesar_cipher(string, shift)
  adjusted_shift = shift % 26

  def shift_the_letter(letter_value, shift_value, z_spot)
    letter_value + shift_value < z_spot ? letter_value + shift_value : letter_value - 26 + shift_value
  end

  string.split('').collect do |char|
    case char.ord
    when 65..90
      shift_the_letter(char.ord, adjusted_shift, 90)
    when 97..122
      shift_the_letter(char.ord, adjusted_shift, 122)
    else
      char.ord
    end.chr
  end.join('')
end

puts caesar_cipher("test", 5)
puts caesar_cipher("TEST", 5)
puts caesar_cipher("zero", 5)
puts caesar_cipher("This is a test!", 5)
puts caesar_cipher("What a string!", 5)
puts caesar_cipher("Test!", 31)