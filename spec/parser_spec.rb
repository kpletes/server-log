# frozen_string_literal: true

require './parser'

RSpec.describe '#server_log' do
  context 'when not provided file_path' do
    let(:file_path) { nil }

    it 'returns an error' do
      expect { server_log(file_path) }.to raise_error(RuntimeError, 'Please enter log path')
    end
  end
end

RSpec.describe '#page_views' do
  context 'when not provided uniq attribute' do
    let(:file_path) { 'log/webserver.log' }
    let(:uniq) { nil }

    it 'returns sorted page views' do
      expect { page_views(file_path, uniq) }.to raise_error(RuntimeError, 'Please select uniq attribute')
    end
  end
end
