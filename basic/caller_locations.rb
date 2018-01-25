#!/usr/bin/env ruby

def abstract(method)
  puts caller_locations(1,1)[0].label
end

class Hoge
  abstract def fuga; end
end

Fuga = Class.new do
  abstract def fuga; end
end
