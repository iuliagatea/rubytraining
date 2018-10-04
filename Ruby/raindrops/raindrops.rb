class Raindrops

  FACTORS_OF_ITEREST = [3, 5, 7]
  RAINDROP_SOUND = { '3': 'Pling', '5': 'Plang', '7': 'Plong' }

  def self.convert(number)
    new(number).to_raindrop_speak
  end

  def initialize (number)
    @number = number
  end

  def to_raindrop_speak
    raise ArgumentError, "The parameter should be a number" unless number.is_a? Numeric
    sound = FACTORS_OF_ITEREST.map { |factor| RAINDROP_SOUND[:"#{factor}"] if number % factor == 0 }.join('')
    sound.empty? ? number.to_s : sound
  end

  private

  attr_reader :number

end
