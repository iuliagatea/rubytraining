class SumOfMultiples

  def initialize(*divisors)
    @divisors = divisors
  end

  def to(number)
    divisors.map do |divisor|
      1.upto(number - 1).select { |num| num % divisor == 0 }
    end.flatten.uniq.inject(0, :+)
  end

  private

  attr_reader :divisors

end
