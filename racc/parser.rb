#!/usr/bin/env ruby

require './sample_parser'

parser = SampleParser.new
statements = parser.parse(STDIN.read)
statements.each do |statement|
  if statement[0] == :assignment
    puts "assign: #{statement[1]} <= #{statement[2]}"
  end
end
