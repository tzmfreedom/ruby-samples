#!/usr/bin/env ruby

def hoge
  l = lambda do
    puts 'lambda'
    return
  end
  l.call
  puts 'hoge'
end

def fuga
  prc = proc do
    puts 'proc'
    return
  end
  prc.call
  puts 'fuga'
end

def foo
  yield
  puts 'foo'
end

hoge
# 'lambda'
# 'hoge'

fuga
# 'proc'

foo do
  return
end
# procと同じ挙動
