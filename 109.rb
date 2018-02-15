


def count(n)

  nums = (1..20).to_a + [25,50]

  k = n / 2
  (1..k).each do |i|
    next unless i < 21 || i == 25 || i == 50
    #p n - 2*i
    last_double = i
    rest = n - 2*i

    arr = (1..3).inject([]) do |arr, j|
      nums.inject(arr) do |a, num|

        middle = j*num
        (1..3).inject([]) do |arr3, j3|
          nums.inject(arr) do |a3, num3|
            a3.push([[j3, num3], [j, num], [2, last_double]]) if middle <= rest && j3*num3 == rest - middle
            a3
          end
          arr3
        end

        a

      end
      arr
    end
    p arr
    #p [rest, [2, last_double]]


  end
end

count(2)
