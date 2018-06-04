#!/usr/bin/env ruby

require 'parser/current'
require 'unparser'

code = <<-RUBY
puts 123
puts :abc
puts "hello world"
RUBY

puts '***parser***'
pp Parser::CurrentRuby.parse(code)

require 'ripper'

puts '***ripper***'
pp Ripper.sexp(code)

def s(type, *children)
  Parser::AST::Node.new(type, children)
end

node = s(:def,
         :foo,
         s(:args,
           s(:arg, :x),
           s(:arg, :y)
         ),
         s(:send,
           s(:lvar, :x),
           :+,
           s(:lvar, :y)
         )
       )
puts Unparser.unparse(node)
