class Squares
  def initialize(first_n_numbers)
    @first_n_numbers = first_n_numbers
  end

  def square_of_sum
    (1..first_n_numbers).reduce(0, :+)**2
  end

  def sum_of_squares
    (1..first_n_numbers).inject(0) { |sum, number| sum + number**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private

  attr_reader :first_n_numbers

end
