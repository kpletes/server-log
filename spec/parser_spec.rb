require 'spec_helper'
require './parser'

describe '#server_log' do
  context 'when not provided file_path' do
    let(:file_path) { nil }

    it 'returns an error' do
      expect { server_log(file_path) }.to raise_error(RuntimeError, 'Please enter log path')
    end
  end
end
