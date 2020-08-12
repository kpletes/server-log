# frozen_string_literal: true

# class for checking that file exists and spliting file for counting
class FileSplit
  attr_reader :file_path

  def initialize(file_path)
    raise 'File not found' unless File.exist?(file_path)

    @file_path = file_path
  end

  def open_and_split
    IO.foreach(file_path).map(&:split)
  end
end
