#!/usr/bin/env ruby
# frozen_string_literal: true

require './lib/file_split'
require './lib/group_count'
require './lib/formatted_sort'

def server_log(log)
  raise 'Please enter log path' unless log

  FileSplit.new(log).open_and_split
end

def page_views(log, uniq)
  raise 'Please select uniq attribute' if uniq.nil?

  counted_log = GroupCount.new(log, ARGV[1] || 0, uniq).group_and_count
  FormattedSort.new(counted_log, uniq).sort_and_prepare
end

if $PROGRAM_NAME == __FILE__
  split_log = server_log(ARGV[0])
  puts page_views(split_log, false)
  puts '-----'
  puts page_views(split_log, true)
end
