require 'spec_helper'
require_relative '../stock_prices'

RSpec.describe StockPrices do
  subject { described_class.new(stock_prices) }

  describe '#profit_picker' do
    let(:stock_prices) { [17,3,6,9,15,8,6,1,10] }

    it 'returns a pair of days representing the best day to buy and sell' do
      expect(StockPrices.new(stock_prices).profit_picker).to eq([1, 4])
    end

    context 'when the best day to buy is the last day' do
      let(:stock_prices) { [17,20,6,9,15,8,7,3,1] }

      it 'returns a pair of days representing the best day to buy and sell' do
        expect(StockPrices.new(stock_prices).profit_picker).to eq([2, 4])
      end
    end

    context 'when the best day to sell is the first day' do
      let(:stock_prices) { [20,17,6,9,15,8,7,3,1] }

      it 'returns a pair of days representing the best day to buy and sell' do
        expect(StockPrices.new(stock_prices).profit_picker).to eq([2, 4])
      end
    end
  end
end
