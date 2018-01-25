#!/usr/bin/env ruby

status = nil
2.times { |i|
  Thread.new {
    sleep 3
    if status == nil
      Thread.pass
      status = []
    end
    status << i
  }
}
