class Raindrops
  def self.convert(number)
    new(number).convert
  end

  def initialize (number)
    @number = number
  end

  def convert
    to_raindrop_speak
  end

  private

  attr_reader :number

  def divisors_of
    (1..number).select { |n| number % n == 0}
  end

  def raindrop(factor)
    case factor
    when 3
      'Pling'
    when 5
      'Plang'
    when 7
      'Plong'
    end
  end

  def to_raindrop_speak
    factors_of_interest = [3, 5, 7]
    existing_factors_in_divisors = (divisors_of & factors_of_interest)
    if existing_factors_in_divisors.empty?
      number.to_s
    else
      existing_factors_in_divisors.map { |factor| raindrop(factor) }.join('')
    end
  end
end
