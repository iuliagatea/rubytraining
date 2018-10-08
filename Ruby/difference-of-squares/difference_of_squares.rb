class Squares
  def self.square_of_sum(first_n_numbers)
    new(first_n_numbers).square_of_sum
  end

  def self.sum_of_squares(first_n_numbers)
    new(first_n_numbers).sum_of_squares
  end

  def self.difference(first_n_numbers)
    new(first_n_numbers).difference
  end

  def initialize(first_n_numbers)
    @first_n_numbers = first_n_numbers
  end

  def square_of_sum
    (1..first_n_numbers).inject(0) { |sum, number| sum + number }**2
  end

  def sum_of_squares
    (1..first_n_numbers).map { |number| number**2 }.inject(0) { |sum, square| sum + square }
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private

  attr_reader :first_n_numbers

end
