class RunLengthEncoding

  def self.encode(data_string)
    new(data_string).encode
  end

  def self.decode(data_string)
    new(data_string).decode
  end

  def initialize(data_string)
    @data_string = data_string
  end

  def encode
    string_chars = data_string.chars
    string_chars.chunk(&:itself).map do |letter, array_of_letters|
      shrink(array_of_letters.count, letter)
    end.join('')
  end

  def decode
    data_string.scan(/(\d*)(\D)/).map do |count, letter|
      count.empty? ? letter : letter * count.to_i
    end.join('')
  end

  private

  attr_reader :data_string

  def shrink(count, letter)
    count > 1 ? count.to_s + letter : letter
  end

end
