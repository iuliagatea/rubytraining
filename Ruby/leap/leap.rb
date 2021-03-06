class Year
  def self.leap?(year)
    new(year).leap?
  end

  def initialize(year)
    @year = year
  end

  def leap?
    (year % 4).zero? && (!(year % 100).zero? || (year % 400).zero?)
  end

  private

  attr_reader :year

end
