#!/usr/bin/env ruby
require 'benchmark/ips'

a = {a: 123}
b = {b: 324}
Benchmark.ips do |x|
  x.report("merge") { a.merge(b) }
  x.report("merge!") { a.merge!(b) }
end

# Warming up --------------------------------------
#                merge    59.429k i/100ms
#               merge!   193.700k i/100ms
# Calculating -------------------------------------
#                merge    749.142k (± 5.3%) i/s -      3.744M in   5.012919s
#               merge!      5.005M (± 6.8%) i/s -     24.987M in   5.017344s
