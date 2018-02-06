def get_proper_divisors(n)
  tmp = (2..Math.sqrt(n).ceil).select{|num| n%num==0}
  tmp += tmp.reverse.map{|num| n/num}
  tmp.unshift(1)
end

p (2..10_000).select{|num| num==get_proper_divisors(get_proper_divisors(num).reduce{|sum,i| sum+i}).reduce{|sum,i| sum+i}}.reduce{|sum,i| sum+i}
