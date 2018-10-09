class Sieve

  def initialize(first_n_numbers)
    @first_n_numbers = first_n_numbers
  end

  def primes
    primes = []
    (2..first_n_numbers).each { |i| primes[i] = i }
    (2..Math.sqrt(first_n_numbers)).each do |i|
      (i * i).step(first_n_numbers, i) { |j| primes[j] = nil } if primes[i]
    end
    primes.compact
  end

  private

  attr_reader :first_n_numbers

end
