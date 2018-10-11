require 'benchmark/ips'
require_relative '../sieve/sieve'
require_relative 'nth_prime'

Benchmark.ips do |x|
  # Configure the number of seconds used during
  # the warmup phase (default 2) and calculation phase (default 5)
  x.config(:time => 5, :warmup => 2)

  # These parameters can also be configured this way
  x.time = 20
  x.warmup = 2

  # Typical mode, runs the block as many times as it can
  # x.report("Sieve") { Sieve.new(100001 * 100).primes[100001] }

  # To reduce overhead, the number of iterations is passed in
  # and the block must run the code the specific number of times.
  # Used for when the workload is very small and any overhead
  # introduces incorrectable errors.
  x.report("sieve") do |times|
    i = 0
    while i < times
      Sieve.new(10001 * 10001).primes[10001]
      i += 1
    end
  end

  x.report("ntn") do |times|
    i = 0
    while i < times
      Prime.nth(10001)
      i += 1
    end
  end

  # To reduce overhead even more, grafts the code given into
  # the loop that performs the iterations internally to reduce
  # overhead. Typically not needed, use the |times| form instead.
  # x.report("Sieve", "Sieve.new(10001 * 100).primes[10001]")
  # x.report("nth", "Prime.nth(10001)")
  # Really long labels should be formatted correctly
  # x.report("addition-test-long-label") { 1 + 2 }

  # Compare the iterations per second of the various reports!
  x.compare!
end
