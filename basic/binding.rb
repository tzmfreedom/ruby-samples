#!/usr/bin/env ruby

require 'binding_of_caller'

def a
  foo = :bar
  b
end

def b
  hoge = :fuga
  c
end

def c
  binding.of_caller(1).eval('puts hoge')
  binding.of_caller(2).eval('puts foo')
  # puts binding.of_caller(1).eval('puts foo') # => error
  # puts binding.of_caller(2).eval('puts hoge')
end

a
