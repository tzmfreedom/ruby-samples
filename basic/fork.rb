#!/usr/bin/env ruby

@hello = 'hoge'
th = Thread.new do
  sleep 3
  puts "#{@hello} in thread"
end

@pid = fork {
  th1 = Thread.new do
    sleep 3
    puts "#{@hello} in thread"
  end
  puts '***'
  puts th1.status
  puts '***'
  puts @hello
  puts '***'
  puts th1.status
  puts th1.join
  puts th1.status
}
