# frozen_string_literal: true

# class for grouping by column and counting uniq or not uniq occurrences
class GroupCount
  attr_reader :array, :group_by

  def initialize(array, group_by, uniq)
    raise 'First argument needs to be an array' unless array.is_a?(Array)
    raise 'First argument is empty' if array.empty?

    @array = array
    @group_by = group_by.to_i
    @uniq = uniq

    raise 'Second argument is bigger than array length' unless @group_by < @array.first.length
    raise 'Second argument cannot be negative' if @group_by.negative?
  end

  def group_and_count
    count(array.group_by { |e| e[group_by] })
  end

  private

  attr_reader :uniq

  def count(grouped_logs)
    grouped_logs.map { |k, v| [k, (uniq ? v.uniq : v).length] }
  end
end
