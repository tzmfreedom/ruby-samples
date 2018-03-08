#!/usr/bin/env ruby

require 'pry'

_pry_.config.print = proc { |output, value| output.puts "=> hoge: #{value}" }
# Pry.config.print = proc { |output, value| output.puts "=> hoge: #{value}" }
# Pry.config.print = proc { |output, value| output.puts "=> #{value.inspect}" }
# Pry.new.repl(binding)
