class String
  def self.substrings(sentence, dictionary)
    sentence.downcase!

    dictionary.reduce(Hash.new(0)) do |result, word|
      if dictionary_word_include?(sentence, word)
        result[word] = sentence.scan(/#{word}/).count
      end

      result
    end
  end

  private

  def self.dictionary_word_include?(sentence, word)
    sentence.include?(word)
  end
end
