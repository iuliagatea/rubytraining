class Grains

  def self.square(number)
    new(number).square
  end

  def self.total
    new.total
  end

  def initialize(number = 64)
    @number = number
  end

  def square
    raise ArgumentError, 'Number should be between 1 and 64' unless number.between?(1, 64)
    2**(number - 1)
  end

  def total
    2**number - 1
  end

  private

  attr_reader :number

end
