class Pangram

  ALPHABET = ('a'..'z').to_a.freeze

  def self.pangram?(sentence)
    new(sentence).pangram?
  end

  def initialize(sentence)
    @sentence = sentence
  end

  def pangram?
    (ALPHABET - sentence.downcase.chars.uniq).empty?
  end

  private

  attr_reader :sentence

end
