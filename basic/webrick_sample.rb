#!/usr/bin/env ruby

require 'webrick'
srv = WEBrick::HTTPServer.new({:DocumentRoot => '/Users/mtajitsu/work/ruby/webrick/',
                               :BindAddress => '127.0.0.1',
                               :Port => 10080})
# srv.mount('/hoge.pl', WEBrick::HTTPServlet::CGIHandler, 'really_executed_script.rb')
Signal.trap(:INT){ srv.shutdown }
srv.start
