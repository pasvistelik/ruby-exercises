require 'benchmark'


def make_palindroms(from,to)
  minimal = from ** 2
  maximal = to ** 2
  p minimal, maximal



  p 999.downto(100).inject([]){|arr, num|
    palindrom = (num.to_s+num.to_s.reverse).to_i;
    arr.push(palindrom) if palindrom >= minimal && palindrom <= maximal
    arr
  }
  p 999.downto(100).inject([]){|arr, num|
    palindrom = (num.to_s[0...-1]+num.to_s.reverse).to_i;
    arr.push(palindrom) if palindrom >= minimal && palindrom <= maximal
    arr
  }

  #p 999.downto(100).map{|num| num.to_s+num.to_s.reverse}
  #p 999.downto(100).map{|num| num.to_s[0...-1]+num.to_s.reverse}

end

=begin
0 1 2 3 4 5 6 7 8 9 11 - 99 101 - 191 - - 909 - 999 1001 - 1991 -- 9009 - 9999 10001 - 10901 -- 19091 - 19991 --- 99999

1 - 11                            2
2 - 22
..
9 - 99
10 - 1001 - 101                   3, 4
11 - 1111 - 111
12 - 1221 - 121
..
99 - 9999 - 999
100 - 100001 - 10001              5, 6
101 - 101101 - 10101
..
999 - 999999 - 99999
1000 - 10000001 - 1000001         7, 8
1001 - 10011001 - 1001001
..
9999 - 99999999 - 9999999
=end
puts Benchmark.measure {

p make_palindroms(100,999)

}
