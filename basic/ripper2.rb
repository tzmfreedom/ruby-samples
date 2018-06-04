#!/usr/bin/env ruby

require 'ripper'

pp Ripper.sexp(File.read(__FILE__))
