class StremingController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Cache-Control'] = 'no-cache'
    response.headers['Content-Type'] = 'text/event-stream'
    while true
      event = 'hello'
      data = { world: 'foo' }
      response.stream.write "event: #{event}\ndata: #{data.to_json}\n\n"
      sleep 1
    end
  rescue ActionController::Live::ClientDisconnected
    response.stream.close
  end

  # control variable assignment
  def view_assigns
    {
      hoge: true
    }
  end
end

