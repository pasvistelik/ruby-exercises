require 'benchmark'

class Integer
  def digits
    return [0] if zero?
    res = []
    quotient = self.abs #take care of negative integers
    until quotient.zero? do
      quotient, modulus = quotient.divmod(10) #one go!
      res.unshift(modulus) #put the new value on the first place, shifting all other values
    end
    res # done
  end
end

def get_result(arr, num, max)
  tmp = arr[num]
  return tmp if tmp
  return num if num == 1 || num == 89
  digits = num.digits
  next_num = digits.inject(0){|sum, i| sum + i**2}
  result = get_result(arr, next_num, max)
  arr[num] = result
  #p num

  #digits.permutation {|n|
  #  n = n.join.to_i
  #  arr[n] = result if n < max
  #}
  result
end

puts Benchmark.measure {

  #p 123.to_s.chars.map{|i| i.to_i}.permutation

  arr = Array.new(10_000_000)
  #TODO: Use f(123) == f(132) == f(213) == f(231) == f(312) == f(321)
  (1..arr.length).each do |num|
    arr[num] = get_result(arr, num, arr.length)
  end

  p arr.count{|num| num == 89}
}
