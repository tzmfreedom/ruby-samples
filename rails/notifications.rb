#!/usr/bin/env ruby

require 'active_support/all'

ActiveSupport::Notifications.subscribe('hoge') do |*args|
  puts args
end

ActiveSupport::Notifications.instrument('hoge', { foo: true }) do
  puts 'start'
  sleep 2
  puts 'end'
end
