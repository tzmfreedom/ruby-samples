#!/usr/bin/env ruby

require 'binding_of_caller'

def a
  b
end

def b
  c
end

def c
  binding.callers.each do |b|
    b.eval 'puts "#{__FILE__} line.#{__LINE__}"'
  end
end

a
