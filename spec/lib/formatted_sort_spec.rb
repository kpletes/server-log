# frozen_string_literal: true

require 'formatted_sort'

RSpec.describe FormattedSort, type: :class do
  let(:uniq) { nil }
  let(:array) { nil }
  let(:subject) { described_class.new(array, uniq).sort_and_prepare }

  context 'when provided wrong type as first argument' do
    it 'returns an error' do
      expect { subject }.to raise_error(RuntimeError, 'First argument needs to be an array')
    end
  end

  context 'when provided empty array as first argument' do
    let(:array) { [] }
    it 'returns an error' do
      expect { subject }.to raise_error(RuntimeError, 'Array is empty')
    end
  end

  context 'when provided right arguments' do
    let(:array) { [['126.318.035.038', 18]] }
    let(:output) { ['126.318.035.038 18 visits'] }
    it 'returns correct output' do
      expect { subject }.to_not raise_error
      expect(subject).to_not be_empty
      expect(subject).to eq(output)
    end
  end
end
