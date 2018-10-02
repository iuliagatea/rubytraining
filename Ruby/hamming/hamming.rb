class Hamming

  def self.compute(sequence1, sequence2)
    new(sequence1, sequence2).compute
  end

  def initialize(sequence1, sequence2)
    @sequence1 = sequence1
    @sequence2 = sequence2
  end

  def compute
    raise ArgumentError, "Sequencies with different length!" unless sequence1.length == sequence2.length
    return 0 if sequence1 == sequence2
    compare_sequences
  end

  private

  attr_reader :sequence1, :sequence2

  def compare_sequences
    sequence1_chars = @sequence1.chars
    sequence2_chars = @sequence2.chars
    combined = sequence1_chars.zip(sequence2_chars)
    combined.select { |seq1_value, seq2_value| seq1_value != seq2_value }.count
  end

end
