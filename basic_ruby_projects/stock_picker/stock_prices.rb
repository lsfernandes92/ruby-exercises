class StockPrices
  attr_reader :stock_prices

  def initialize(stock_prices)
    @stock_prices = stock_prices
    @profit = 0
    @best_buy_day = 0
    @best_sell_day = 0
  end

  def profit_picker
    sorted_stock_prices.each do |min_price|
      stock_prices[stock_price_day(min_price)...stock_prices_length].each do |max_price|
        if better_profit?(max_price, min_price)
          @profit = calculate_profit(max_price, min_price)
          @best_buy_day = stock_price_day(min_price)
          @best_sell_day = stock_price_day(max_price)
        end
      end
    end

    [@best_buy_day, @best_sell_day]
  end

  private

  def sorted_stock_prices
    stock_prices.dup.sort
  end

  def stock_prices_length
    stock_prices.length
  end

  def stock_price_day(stock)
    stock_prices.index(stock)
  end

  def calculate_profit(max_price, min_price)
    max_price - min_price
  end

  def better_profit?(max_price, min_price)
    (max_price - min_price) > @profit
  end
end
