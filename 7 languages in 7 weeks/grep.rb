def grep text
  File.open 'text.txt', 'r' do |f|
    i = 0
    f.readlines.each do |line|
      i+=1
      puts "#{i} #{line}" if line =~ /.*#{text}.*/
    end 
  end
end

grep 'magic'
