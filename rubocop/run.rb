begin
  puts 123
rescue => e
  puts true
  puts e
end

begin
  puts 123
rescue => e
  puts e
end

begin
  puts 123
rescue
  puts true
end

begin
  puts 123
rescue => e
  puts true
end

begin
  puts 123
rescue => e
  puts true
  puts 123
end

begin
  puts 123
rescue SystemCallError, RegexpError => e
  puts e
  puts true
end

begin
  puts 123
rescue SystemCallError, RegexpError => e
  puts true
  puts false
end
