require 'benchmark'

def get_result(arr, num)
  tmp = arr[num]
  return tmp if tmp
  return num if num == 1 || num == 89
  next_num = num.to_s.chars.inject(0){|sum, i| sum + i.to_i**2}
  result = get_result(arr, next_num)
  arr[num] = result
  result
end

puts Benchmark.measure {

  arr = Array.new(10_000_000)
  #TODO: Use f(123) == f(132) == f(213) == f(231) == f(312) == f(321)
  (1..arr.length).each do |num|
    arr[num] = get_result(arr, num)
  end

  p arr.count{|num| num == 89}
}
