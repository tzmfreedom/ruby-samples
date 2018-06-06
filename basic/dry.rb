#!/usr/bin/env ruby

require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module
end

class User < Dry::Struct
  attribute :name, Types::String
  attribute :age,  Types::Integer
end

pp User.new(name: 'hoge', age: 35)
