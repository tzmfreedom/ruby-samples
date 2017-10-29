
#!/usr/bin/env ruby

# benchmark for array O(N) search
#
# 10,000: 0.445621000835672 ms
# 100,000: 4.017118000774644 ms
# 1,000,000: 38.831360998301534 ms
# 10,000,000: 400.17953099959414 ms
# 100,000,000: 3828.364781002165 ms

require 'benchmark'

class Integer
  def to_comma_number
    self.to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')
  end
end

5.times do |i|
  max = 10_000 * (10 ** i)
  sec = Benchmark.realtime do |r|
      (1..max).to_a.include? max
  end
  puts "#{max.to_comma_number}: #{sec*1000} ms"
end
