require 'benchmark'

puts Benchmark.measure {
  b = 2 + 100.downto(1+1).inject(Rational(0)) do |result, n|
    a = n%3==0 ? 2*n/3 : 1
    1 / (a + result)
  end

  #p b
  p b.numerator.to_s.chars.inject(0){|sum, i| sum + i.to_i}
}
