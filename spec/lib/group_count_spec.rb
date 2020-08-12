# frozen_string_literal: true

require 'group_count'

RSpec.describe GroupCount, type: :class do
  let(:uniq) { nil }
  let(:group_by) { nil }
  let(:array) { [['/help_page/1', '126.318.035.038'], ['/help_page', '126.318.035.038']] }
  let(:subject) { described_class.new(array, group_by, uniq).group_and_count }

  context 'when first argument is not an array' do
    let(:array) { '' }
    it 'returns an error' do
      expect { subject }.to raise_error(RuntimeError, 'First argument needs to be an array')
    end
  end

  context 'when first argument is empty' do
    let(:array) { [] }
    it 'returns an error' do
      expect { subject }.to raise_error(RuntimeError, 'First argument is empty')
    end
  end

  context 'when second argument number too big' do
    let(:group_by) { 10 }
    it 'returns an error' do
      expect { subject }.to raise_error(RuntimeError, 'Second argument is bigger than array length')
    end
  end

  context 'when second argument is a negative number' do
    let(:group_by) { -1 }
    it 'returns an error' do
      expect { subject }.to raise_error(RuntimeError, 'Second argument cannot be negative')
    end
  end

  context 'when provided right arguments' do
    let(:group_by) { 1 }
    let(:output) { [['126.318.035.038', 2]] }
    it 'returns correct output' do
      expect { subject }.to_not raise_error
      expect(subject).to_not be_empty
      expect(subject).to eq(output)
    end
  end
end
