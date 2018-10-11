class Prime
  def self.nth(n)
    new(n).nth
  end

  def initialize(n)
    @n = n
    @primes = [2, 3]
  end

  def nth
    raise ArgumentError, 'N must be positive' if n < 1
    number = @primes.last
    while n > @primes.length
      number += 2
      unless @primes.any? { |prime| number % prime == 0 }
        @primes.push(number)
      end
    end

    @primes[n - 1]
  end

  private

  attr_reader :n

end
