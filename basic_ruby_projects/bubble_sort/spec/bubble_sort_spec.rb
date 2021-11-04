# frozen_string_literal: true

require 'spec_helper'
require_relative '../bubble_sort'

RSpec.describe BubbleSort do
  context '#sort' do
    context 'with numbers' do
      let(:numbers) { [4, 3, 78, 2, 0, 2] }

      it 'returns a sorted array' do
        expect(BubbleSort.sort(numbers)).to eq([0, 2, 2, 3, 4, 78])
      end
    end

    context 'with letters' do
      let(:numbers) { %w[d a c b] }

      it 'returns a sorted array' do
        expect(BubbleSort.sort(numbers)).to eq(%w[a b c d])
      end
    end

    context 'with invalid input' do
      it 'raises and error ' do
        expect { BubbleSort.sort('foo') }.to raise_error('Please only numbers can be sorted')
      end
    end
  end
end
