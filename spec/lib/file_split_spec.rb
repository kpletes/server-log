# frozen_string_literal: true

require 'file_split'

RSpec.describe FileSplit, type: :class do
  let(:file_path) { nil }
  let(:subject) { described_class.new(file_path).open_and_split }

  context 'when provided wrong file_path' do
    let(:file_path) { 'log/webserverr_new.log' }

    it 'returns an error' do
      expect { subject }.to raise_error(RuntimeError, 'File not found')
    end
  end

  context 'when provided right file_path' do
    let(:file_path) { 'log/webserver.log' }
    let(:output) { ['/help_page/1', '126.318.035.038'] }

    it 'returns correct output' do
      expect { subject }.to_not raise_error
      expect(subject).to_not be_empty
      expect(subject).to include(output)
    end
  end
end
