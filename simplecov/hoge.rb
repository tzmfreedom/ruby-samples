#!/usr/bin/env ruby

require 'simplecov'
require 'json'
Coverage.start
require './fuga'
puts Coverage.result.to_json
