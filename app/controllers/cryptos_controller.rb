class CryptosController < ApplicationController
  
  # before_action :crypto_data

  def index
    # UserCoin.delete_all
    # @cryptos = UserCoin.all
  end

  # def get_main_prices
  #   @usd_to_rub = Cryptocompare::CoinSnapshot.find('USDT', 'RUB')['Data']
  #   @sol_to_usd = Cryptocompare::CoinSnapshot.find('SOL', 'USD')['Data']
  #   @btc_to_usd = Cryptocompare::CoinSnapshot.find('BTC', 'USD')['Data']
  #   @xrp_to_usd = Cryptocompare::CoinSnapshot.find('XRP', 'USD')['Data']
  #   respond_to :js
  # end

  # def crypto_modal

  #   respond_to :js
  # end

  # def add_coin
  #   @symbol = params[:symbol]
  #   user_coin_present = UserCoin.find_by(crypto_symbol: @symbol, user_id: current_user.id)

  #   if !user_coin_present.present?
  #     @added = UserCoin.create(crypto_symbol: @symbol, user_id: current_user.id)
  #   end
  #   respond_to :js
  # end

  # def coin_info_modal
  #   @symbol = params[:symbol]
  #   @coin_info = Cryptocompare::CoinList.all["Data"][@symbol]
  #   # @coin_dop_info = Cryptocompare::Price.generate_avg('BTC', 'USD', ['Coinbase', 'bybit'])
  #   respond_to :js
  # end

  # def search_coins
  #   key = params[:key]
  #   @coins = coin_search(key, crypto_data)
    
  #   respond_to :js
  # end

  private

  # def crypto_data
  #   Cryptocompare::CoinList.all["Data"]
  # end

end
