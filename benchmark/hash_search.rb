#!/usr/bin/env ruby

require 'benchmark/ips'

foo = 'foo'
bar = 'bar'
array = ['foo', 'bar']
hash = {a: 'foo', b: 'bar'}

nested_hash = {'foo' => {'bar' => true}}
array_hash = { array => true }
hash_hash = { hash => true }

Benchmark.ips do |x|
  x.report('nested') { nested_hash[foo][bar] }
  x.report('array') { array_hash[array] }
  x.report('hash') { hash_hash[hash] }
end
