#!/usr/bin/env ruby

require 'i18n'

I18n.load_path << 'locales/en.yml'
puts I18n.t('hoge')
puts I18n.t('fuga')
puts I18n.t('hello')
puts I18n.t('proc')

I18n.load_path = ['locales/ja.rb']
I18n.locale = :ja
puts "foo: #{I18n.t('foo')}"
puts "hoge: #{I18n.t('hoge')}"
puts "hello: #{I18n.t('hello')}"
puts "foo2.bar1: #{I18n.t('foo2.bar1')}"
puts "***"
puts File.read('locales/ja.rb')
