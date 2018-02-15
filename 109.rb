
def find(nums, number)
  (1..3).inject([[0,0]]) do |arr, j|
    nums.inject(arr) do |a, num|
      a.push([j, num]) if j*num <= number
      a
    end
    arr
  end
end

nums = (1..20).to_a + [25,50]
#p find(nums, 5)



def count(n)

  nums = (1..20).to_a + [25,50]

  arr = nums.inject([]) do |arr, num|
    if num * 2 <= n
      last = [2, num]
      middles = find(nums, n - num*2)
      #p middles
      middles.each do |i, k|
        # p n
        # p n - num*2
        # p n - num*2 - i*k
        firsts = find(nums, n - num*2 - i*k)
        firsts.each do |j, first|
          arr.push([[j, first], [i, k], last])
        end
      end
    end
    #arr.push([n - num * 2, num*2])
    arr
  end

  #p arr

  #arr.inject([]) do |arr, (rest, num)|

  #end

  #p arr

  # k = n / 2
  # (1..k).each do |i|
  #   next unless i < 21 || i == 25 || i == 50
  #   #p n - 2*i
  #   last_double = i
  #   rest = n - 2*i
  #
  #
  #
  #
  #
  #   arr = (1..3).inject([]) do |arr, j|
  #     nums.inject(arr) do |a, num|
  #
  #       middle = j*num
  #       (1..3).inject([]) do |arr3, j3|
  #         nums.inject(arr) do |a3, num3|
  #           a3.push([[j3, num3], [j, num], [2, last_double]]) if middle <= rest && j3*num3 == rest - middle && num3+num == 4
  #           a3
  #         end
  #         arr3
  #       end
  #
  #       a
  #
  #     end
  #     arr
  #   end
  #   p arr
  #   p [rest, [2, last_double]]


  #end
  arr
end

# n = 6
# count(n).select{|i| i.inject(0){|sum,(a,b)| sum + a*b} == n}.map{|(a,b,_)| [a,b]}.each do |i|
#   p i#.map{|(a,b,_)| [a,b]}.flat_map{|(a,b)| [a,b]}
# end



# [[1, 4], [0, 0], [2, 1]] -- [[0, 0], [1, 4], [2, 1]]
#
#
#
# [[1, 2], [1, 2], [2, 1]] --
# [[2, 1], [1, 2], [2, 1]] -- [[1, 2], [2, 1], [2, 1]]
# [[1, 1], [1, 3], [2, 1]] -- [[1, 3], [1, 1], [2, 1]]
#
#
# [[2, 1], [2, 1], [2, 1]] --
# [[0, 0], [2, 2], [2, 1]] -- [[2, 2], [0, 0], [2, 1]]
# [[1, 1], [3, 1], [2, 1]] -- [[3, 1], [1, 1], [2, 1]]
#
#
# [[1, 1], [1, 1], [2, 2]] --
# [[0, 0], [1, 2], [2, 2]] -- [[1, 2], [0, 0], [2, 2]]
# [[0, 0], [2, 1], [2, 2]] -- [[2, 1], [0, 0], [2, 2]]
# [[0, 0], [0, 0], [2, 3]] --

# [[1, 3], [0, 0], [2, 1]] -
# [[3, 1], [0, 0], [2, 1]]
# [[1, 2], [1, 1], [2, 1]] -
# [[2, 1], [1, 1], [2, 1]] -
# [[1, 1], [1, 2], [2, 1]] -
# [[0, 0], [1, 3], [2, 1]]
# [[1, 1], [2, 1], [2, 1]] -
# [[0, 0], [3, 1], [2, 1]]
# [[1, 1], [0, 0], [2, 2]]
# [[0, 0], [1, 1], [2, 2]] -

result = (5..5).inject(0) do |sum, n|
  a = count(n).select{|i| i.inject(0){|sum,(a,b)| sum + a*b} == n}
  b = a.map{|(a,b,c)| [a,b,c]}

  e = b.select{|(a,b,c)| a == b}
  #p e.size

  c = b.map{|(a,b,c)| a+b+c}
  d = b.map{|(a,b,c)| b+a+c}
  a == b

  p a.each{|x| p x}
  tmp = (b-e).length / 2 + e.length
  tmp = ((b-e).length + e.length) /2

  #p d
  #p c - d

  #c = b.flat_map{|(a,b)| [a,b]}.uniq

  #p c

  sum + tmp
end

p result
