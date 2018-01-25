#!/usr/bin/env ruby

require 'benchmark/ips'

Benchmark.ips do |x|
  x.report("ActiveRecord::Base") { User.find_by(id: 1) }
  x.report("exists?") { User.exists?(id: 1) }
  x.report("pluck") { User.where(id: 1).pluck(:id) }
end

# Warming up --------------------------------------
#   ActiveRecord::Base   101.000  i/100ms
#              exists?    94.000  i/100ms
#                pluck   104.000  i/100ms
# Calculating -------------------------------------
#   ActiveRecord::Base      1.186k (±12.7%) i/s -      5.858k in   5.038901s
#              exists?    750.568  (±40.0%) i/s -      2.914k in   5.221521s
#                pluck    386.743  (±32.8%) i/s -      1.768k in   5.198125s
