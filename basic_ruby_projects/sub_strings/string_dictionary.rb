class StringDictionary
  attr_reader :sentence, :dictionary

  def initialize(sentence, dictionary)
    @sentence = sentence
    @dictionary = dictionary
  end

  def substrings
    sentence.downcase!

    dictionary.reduce(Hash.new(0)) do |hash, word|
      if word_include_in_sentence?(word)
        hash[word] = count_word_in_sentence(word)
      end

      hash
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
