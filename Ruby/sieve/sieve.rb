class Sieve

  def initialize(first_n_numbers)
    @first_n_numbers = first_n_numbers
  end

  def primes
    (1..first_n_numbers).select { |number| count_divisors_of(number) == 2 }
  end

  private

  attr_reader :first_n_numbers

  def count_divisors_of(number)
    (1..number).select { |factor| (number % factor).zero? }.count
  end

end
