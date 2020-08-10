#!/usr/bin/env ruby

require './lib/file_split'

def server_log(log)
  raise 'Please enter log path' unless log

  FileSplit.new(log).open_and_split
end

def page_views(log, uniq)
  raise 'Please select uniq attribute' if uniq.nil?

  puts log
end

if $0 == __FILE__
  split_log = server_log(ARGV[0])
  puts page_views(split_log, false)
  puts '-----'
  puts page_views(split_log, true)
end
