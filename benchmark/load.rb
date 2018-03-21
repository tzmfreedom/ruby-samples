#!/usr/bin/env ruby

require 'benchmark/ips'

abs_path = "#{Dir.pwd}/sample.rb"
load 'sample.rb'
load abs_path

Benchmark.ips do |x|
  x.report("load") { load('sample.rb') }
  x.report("load relative path") { load('./sample.rb') }
  x.report("load absolute path") { load(abs_path) }
end
