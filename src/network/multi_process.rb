#!/usr/bin/env ruby

require 'socket'

def accept(i, server)
  while sock = server.accept
    puts sock.puts 'hogehoge'
    msg = sock.gets
    sock.puts "echo-back: #{i} : #{msg}"
    sock.close
  end
end

pids = []
server = TCPServer.new(2000)
server.listen(5)
2.times do |i|
  pid = fork {
    accept(i, server)
  }
  pids << pid if pid
end

puts pids

pids.each { |pid| Process.waitpid(pid) }
