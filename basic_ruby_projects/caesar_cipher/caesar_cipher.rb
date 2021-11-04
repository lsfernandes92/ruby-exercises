# frozen_string_literal: true

class CaesarCipher
  class << self
    def encode(string_to_encode, shift_factor)
      raise 'Please ensure that shift factor is an Integer' unless shift_factor.is_a?(Integer)
      raise 'Please ensure to input a String to be encode' unless string_to_encode.is_a?(String)

      encode_string = ''
      string_to_encode.each_char { |char| encode_string << shift_letter(char, shift_factor) }
      encode_string
    end

    private

    def shift_letter(letter, shift_factor)
      case letter.ord
      when 97..122
        downcase_alphabet.rotate(downcase_alphabet.index(letter))[shift_factor]
      when 65..90
        upcase_alphabet.rotate(upcase_alphabet.index(letter))[shift_factor]
      else
        letter
      end
    end

    def downcase_alphabet
      ('a'..'z').to_a
    end

    def upcase_alphabet
      ('A'..'Z').to_a
    end
  end
end
