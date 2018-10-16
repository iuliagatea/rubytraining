class SumOfMultiples

  def initialize(*divisors)
    @divisors = divisors
  end

  def to(number)
    1.upto(number - 1).select do |num|
      divisors.any? { |divisor| num % divisor == 0}
    end.inject(0, :+)
  end

  private

  attr_reader :divisors

end
