#!/usr/bin/env ruby

require './lib/file_split'

def server_log(log)
  raise 'Please enter log path' unless log

  FileSplit.new(log).open_and_split
end
