
a = (1..16).to_a
i = 0
a.each do |item|
  p a[i, 4] if(i % 4 == 0)
  i +=1
end
a.each_slice(4) { |x| puts x.to_s }


n = rand(10)
puts 'guess' until gets.to_i == n
puts 'you win'
