require 'benchmark'

def get_proper_divisors2(n)
  tmp = (2..Math.sqrt(n).ceil).select{|num| n%num==0}
  tmp += tmp.reverse.map{|num| n/num}
  tmp.unshift(1)
end

def get_proper_divisors(n)
  (2..Math.sqrt(n).ceil)
    .select{|num| n%num==0}
    .flat_map{|num| [num, n/num]}
    .unshift(1)
end

def is_amicable?(num)
  num == get_proper_divisors(get_proper_divisors(num).reduce(:+)).reduce(:+)
end

#(2..10).each{|n| p get_proper_divisors(n)}

puts Benchmark.measure {
  p (2..10_000).select{|num| is_amicable?(num)}.reduce(:+)
}
puts Benchmark.measure {
  p (2..10_000).inject(0){|sum, num| is_amicable?(num) ? sum+num : sum}
}
