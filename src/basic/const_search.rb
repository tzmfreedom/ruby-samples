#!/usr/bin/env ruby

class Foo
  AAA = :aaa
  BBB = :bbb
end

module Bar
  CCC = :ccc
end

module Hoge
  include Bar
  puts "CCC: #{CCC}"
  BBB = :bar
  class Fuga < Foo
    puts "AAA: #{AAA}"
    puts "BBB: #{BBB}"
    puts "DDD: #{DDD}"
    puts "CCC: #{CCC}"
  end
end

puts Hoge::Fuga.new
