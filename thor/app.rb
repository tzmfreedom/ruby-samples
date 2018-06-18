#!/usr/bin/env ruby

require 'thor'

class App < Thor
  namespace :my
  desc "hoge", "example of hoge"
  def hoge
    puts "hello world"
  end

  desc "fuga", "example of fuga"
  def fuga(a, b)
    puts a
    puts "***"
    puts b
  end

  desc "foo", "example metho_option"
  method_option :file, aliases: "-f", type: :boolean, banner: "HOGEHOGE", desc: "hogehoge-file"
  def foo
    puts options[:file]
  end

  default_task :foo
end

App.start
