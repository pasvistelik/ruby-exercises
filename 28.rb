require 'benchmark'

puts Benchmark.measure {
  # O(n)
  p (1..(1001-1)/2).inject(1){|sum, n| sum + (4*n**2+4*n+1) + (1+4*n**2) + (4*n**2-2*n+1) + (4*n**2+2*n+1)}
}

puts Benchmark.measure {
  # O(n)
  p (1..(1001-1)/2).inject(1){|sum, n| sum + 4*(4*n**2+n+1)}
}

puts Benchmark.measure {
  # O(n)
  p 1 + 4* (1..(1001-1)/2).inject(0){|sum, n| sum + (4*n**2+n+1)}
}

puts Benchmark.measure {
  # O(1)
  n = (1001-1)/2
  p 1 + 10*n**2 + (16*n**3 + 26*n)/3
}