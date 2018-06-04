#!/usr/bin/env ruby

require 'ripper'
require 'cgi'

class Ruby2HTML < Ripper::Filter
  def on_default(event, token, f)
    f << token
  end

  def on_comment(token, f)
    f << "## #{token}"
  end

  def on_tstring_beg(token, f)
    f << "#{token}Foo:"
  end

  def on_tstring_end(token, f)
    f << ":Bar#{token}"
  end
end

puts Ruby2HTML.new(STDIN).parse('')
