#!/usr/bin/env ruby

module Hoge
  puts '--Hoge'
  puts Module.nesting
  module Fuga
    puts '--Foge'
    puts Module.nesting
    class Foo
      puts '--Foo'
      puts Module.nesting
      def index
        puts '--Foo#index'
        puts Module.nesting
      end

      def self.index
        puts '--Foo.index'
        puts Module.nesting
      end
    end
  end
end

module Hoge::Fuga
  puts '--Hoge::Fuga'
  puts Module.nesting
  class Foo
    puts '--Foo'
    puts Module.nesting
  end
end

class Hoge::Fuga::Foo
  puts '--Hoge::Fuga::Foo'
  puts Module.nesting
end

Hoge::Fuga::Foo.new.index
Hoge::Fuga::Foo.index
