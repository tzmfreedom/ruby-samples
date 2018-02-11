#!/usr/bin/env ruby

def a
  b
rescue => e
  binding.irb
end

def b
  c
end

def c
  raise StandardError
end

a
