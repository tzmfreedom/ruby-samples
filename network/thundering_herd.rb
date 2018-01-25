#!/usr/bin/env ruby

require 'socket'

def accept(i, server)
  while sock = server.accept
    puts sock.puts 'hogehoge'
    msg = sock.gets
    sock.puts "echo-back: #{msg}"
    sock.close
  end
end

def select(i, server)
  while socks = IO.select([server]); reads = socks[0]
    puts "wake up: #{i}"
    begin
      sock = reads[0].accept_nonblock
    rescue => e
      puts "Error: #{e.class} #{e.message}"
      next
    end
    puts "get socket: #{i}"
    puts sock.puts 'hogehoge'
    msg = sock.gets
    sock.puts "echo-back: #{msg}"
    sock.close
  end
end

server = TCPServer.new(2000)
server.listen(5)
2.times.map do |i|
  Thread.new {
    select(i, server)
  }
end.each(&:join)

