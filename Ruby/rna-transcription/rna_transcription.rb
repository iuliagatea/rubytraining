class Complement

  TRANSCRIPT = { 'A' => 'U', 'C' => 'G', 'G' => 'C', 'T' => 'A' }

  def self.of_dna(dna_sequence)
    new(dna_sequence).of_dna
  end

  def initialize(dna_sequence)
    @dna_sequence = dna_sequence
  end

  def of_dna
    return '' if dna_sequence.empty?
    raise ArgumentError, 'Invalid DNA sequence!' unless check_validation
    rna_transcription
  end

  private

  attr_reader :dna_sequence

  def check_validation
    dna_sequence[/[ACTG]+/] == dna_sequence
  end

  def rna_transcription
    dna_sequence_chars = dna_sequence.chars
    dna_sequence_chars.map { |char| TRANSCRIPT[char] }.join('')
  end

end
