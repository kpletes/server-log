# class for sorting and adding uniq string to array
class FormattedSort
  attr_reader :array

  def initialize(array, uniq)
    raise 'First argument needs to be an array' unless array.is_a?(Array)
    raise 'Array is empty' if array.empty?

    @array = array
    @uniq = uniq
  end

  def sort_and_prepare
    array.sort_by { |_, v| -v }.map { |k, v| "#{k} #{v} #{uniq_string}" }
  end

  private

  attr_reader :uniq

  def uniq_string
    uniq ? 'uniq views' : 'visits'
  end
end
