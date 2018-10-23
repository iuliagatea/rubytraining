class Crypto

  def initialize(plaintext)
    @plaintext = plaintext
  end

  def ciphertext
    plaintext.empty? ? '' : encode
  end

  private

  attr_reader :plaintext

  def normalized_text
    @normalized_text ||= plaintext.downcase.delete(' ').gsub(/[^\dA-Za-z]/, '')
  end

  def number_of_segments
    @number_of_segments ||= (normalized_text.length**0.5).ceil
  end

  def sliced_segments
    segments = normalized_text.chars.each_slice(number_of_segments).to_a
    segments.last << ' ' while segments.last.length < number_of_segments
    segments
  end

  def encode
    sliced_segments.transpose.map(&:join).join(' ')
  end

end
