class FileSplit
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def open_and_split
    IO.foreach(@file_path).map(&:split)
  end
end
