require 'benchmark'

def find(nums, number)
  (1..3).inject([[0,0]]) do |arr, j|
    nums.inject(arr) do |a, num|
      a.push([j, num]) if j*num <= number && (num <= 20 || (num==25 && j!=3)) #|| (num==50 && j==1)
      a
    end
    arr
  end
end

def count(n)
  nums = (1..20).to_a + [25] # WITHOUT 50 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  arr = nums.inject([]) do |arr, num|
    if num * 2 <= n
      last = [2, num]
      find(nums, n - num*2).each do |i, k|
        firsts = find(nums, n - num*2 - i*k)
        firsts.each do |j, first|
          arr.push([[j, first], [i, k], last]) if j*first + i*k + num*2 == n && j <= i
        end
      end
    end
    arr
  end
  arr
end

puts Benchmark.measure {
  result = (1..99).inject(0) do |sum, n|
    x = count(n).inject([]){|sub_arr, (i,j,k)|
      sub_arr.push([i,j,k]) if !sub_arr.include?([j,i,k])
      sub_arr
    }
    sum + x.size
  end
  p result
}
