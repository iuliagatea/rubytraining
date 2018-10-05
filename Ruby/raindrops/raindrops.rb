class Raindrops

  FACTORS_OF_ITEREST = [3, 5, 7]
  RAINDROP_SOUND = { '3' => 'Pling', '5' => 'Plang', '7' => 'Plong' }

  def self.convert(number)
    new(number).to_raindrop_speak
  end

  def initialize (number)
    @number = number
  end

  def to_raindrop_speak
    raise ArgumentError, "The parameter should be a number" unless number.is_a? Numeric
    existing_factors_in_divisors = (divisors_of & FACTORS_OF_ITEREST)
    existing_factors_in_divisors.empty? ?
      number.to_s :
      existing_factors_in_divisors.map { |factor| RAINDROP_SOUND[factor.to_s] }.join('')
  end

  private

  attr_reader :number

  def divisors_of
    (1..number).select { |n| number % n == 0 }
  end

end
