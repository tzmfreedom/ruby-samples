#!/usr/bin/env ruby

require 'active_support'
require 'active_support/core_ext'
require 'open-uri'

hash = Hash.from_xml open(ARGV[0]).read
json = hash.to_json
puts json
