#!/usr/bin/env ruby

require "bundler"
require "json"

response = Faraday.get "https://tcsqfos5njl8.runscope.net"
puts response.body
puts "****"

f = Faraday.new(url: "https://tcsqfos5njl8.runscope.net")
response = f.get "/hoge/fuga", { hoge: 123 }
puts response.body
puts "****"

response = f.post do |r|
  r.path = "/bbb/ccc"
  r.headers["X-Hogehoge-Header"] = "Fugafuga"
  r.body = {hoge: 123, fuga: false}.to_json
end
puts response.body
