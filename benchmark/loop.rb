#!/usr/bin/env ruby

require 'benchmark/ips'

def call
  i = 0
  while i < 1000
    i += 1
  end
end

call; call; call; call; call

Benchmark.ips do |x|
  x.report('call') { call }
  x.compare!
end
