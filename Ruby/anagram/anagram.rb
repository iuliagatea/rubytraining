class Anagram

  def initialize(word)
    @word = word
  end

  def match(anagrams)
    anagrams.select do |anagram|
      !anagram.casecmp(word).zero? && sorted_chars_of(anagram) == sorted_word
    end
  end

  private

  attr_reader :word

  def sorted_chars_of(string)
    string.downcase.chars.sort.join('')
  end

  def sorted_word
    @sorted_word ||= sorted_chars_of(word)
  end

end
