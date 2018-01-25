#!/usr/bin/env ruby

TracePoint.trace(:end) do |t|
  puts <<~DEBUG
  self: #{t.self}
  lineno: #{t.lineno}
  DEBUG
end

TracePoint.trace(:b_return) do |t|
  puts <<~DEBUG
  self: #{t.self}
  lineno: #{t.lineno}
  DEBUG
end

class Hoge
end

Class.new do
end

