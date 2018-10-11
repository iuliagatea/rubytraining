class Sieve

  def initialize(first_n_numbers)
    @first_n_numbers = first_n_numbers
  end

  def primes
    numbers = (2..first_n_numbers).to_a
    not_prime = []
    primes = []
    numbers.each_with_index do |number, index|
      next if not_prime.include?(number)
      primes << number
      ((primes.last)..first_n_numbers).step(primes.last).each_with_index do |num, index|
        next if index == 0 || num == primes.last
        not_prime << num
      end
    end
    primes
  end

  private

  attr_reader :first_n_numbers

end
