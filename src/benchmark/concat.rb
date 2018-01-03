#!/usr/bin/env ruby

require 'benchmark/ips'

hoge = "hoge"
fuga = "fuga"
Benchmark.ips do |x|
  x.report("+") { hoge.to_s + "_" + fuga.to_s }
  x.report("String interpolation") { "#{hoge}_#{fuga}" }
end

# Warming up --------------------------------------
#                    +   132.553k i/100ms
# String interpolation   149.151k i/100ms
# Calculating -------------------------------------
#                    +      2.437M (± 4.5%) i/s -     12.195M in   5.015221s
# String interpolation      2.957M (± 4.5%) i/s -     14.766M in   5.004267s
