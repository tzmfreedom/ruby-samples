#!/usr/bin/env ruby

require 'benchmark/ips'

$LOAD_PATH.push('.')
abs_path = "#{Dir.pwd}/sample.rb"
require 'sample.rb'
require abs_path

Benchmark.ips do |x|
  x.report("load") { require('sample.rb') }
  x.report("load relative path") { require('./sample.rb') }
  x.report("load absolute path") { require(abs_path) }
end
