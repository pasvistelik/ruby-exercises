p (1..100).reduce(:*).to_s.chars.inject(0){|sum,i| sum + i.to_i}
