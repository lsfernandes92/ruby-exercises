# frozen_string_literal: true

class StringDictionary
  attr_reader :sentence, :dictionary

  def initialize(sentence, dictionary)
    @sentence = sentence
    @dictionary = dictionary
  end

  def substrings
    sentence.downcase!

    dictionary.each_with_object(Hash.new(0)) do |word, hash|
      hash[word] = count_word_in_sentence(word) if word_include_in_sentence?(word)
    end
  end

  private

  def word_include_in_sentence?(word)
    sentence.include?(word)
  end

  def count_word_in_sentence(word)
    sentence.scan(/#{word}/).count
  end
end
