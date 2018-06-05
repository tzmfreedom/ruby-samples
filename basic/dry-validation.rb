#!/usr/bin/env ruby

require 'dry-validation'

schema = Dry::Validation.Schema do
  required(:email).filled(:str?)
  required(:age).filled(:int?, gt?: 18)
end

errors = schema.call(email: 'hoge', age: 19).messages

puts errors.inspect

puts schema.call(email: nil, age: 17).messages
