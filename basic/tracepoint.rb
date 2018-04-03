#!/usr/bin/env ruby

TracePoint.trace(:end) do |t|
  puts <<~DEBUG
  ******
  type: end
  self: #{t.self}
  lineno: #{t.lineno}
  DEBUG
end

TracePoint.trace(:b_return) do |t|
  puts <<~DEBUG
  ******
  type: b_return
  self: #{t.self}
  lineno: #{t.lineno}
  DEBUG
end

TracePoint.trace(:line) do |t|
  puts <<~DEBUG
  ******
  type: line
  self: #{t.self}
  lineno: #{t.lineno}
  DEBUG
end

TracePoint.trace(:raise) do |t|
  puts <<~DEBUG
  ******
  type: raise
  self: #{t.self}
  lineno: #{t.lineno}
  DEBUG
end

a = :hello

class Hoge
end

Class.new do
end

raise 'hogehoge'
