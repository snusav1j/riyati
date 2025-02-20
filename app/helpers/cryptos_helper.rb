module CryptosHelper

  # def all_crypto_currencies
  #   all_crypto_currencies = []
  #   Cryptocompare::CoinList.all["Data"].each do |data|
  #     # all_crypto_currencies << data[1]["Symbol"]
  #     all_crypto_currencies << { symbol: data[1]["Symbol"], coin_name: data[1]["CoinName"], coin_full_name: data[1]["FullName"], image_url: data[1]["ImageUrl"]}
  #   end
  #   all_crypto_currencies
  # end

  # def coin_search(key=nil, data=nil, show=false)
  #   result = []
  #   # coins_data = data
  #   if key.present?
  #     data = data.present? ? data : Cryptocompare::CoinList.all["Data"]
  #     key = key.downcase.strip
  #     data.each do |data|
  #       symbol = data[1]["Symbol"].downcase
  #       coin_name = data[1]["CoinName"].downcase
  #       if symbol.include?(key) || coin_name.include?(key)
  #         result << data
  #       end
  #     end
  #     if show
  #       result.sort_by { |hsh| hsh[1]["Symbol"] }.first(20)
  #     else
  #       result.sort_by { |hsh| hsh[1]["Symbol"] }
  #     end
  #   else
  #     if show
  #       result.first(20)
  #     else
  #       result
  #     end
  #   end
  # end

  # # get info by extracted data

  # def get_image_url_by_extracted_data(data)
  #   img_url = data["ImageUrl"]
  #   image_tag("https://www.cryptocompare.com#{img_url}")
  # end

  # def get_coin_name_by_extracted_data(data)
  #   data["CoinName"]
  # end
  
  # def get_coin_website_by_extracted_data(data)
  #   data["AssetWebsiteUrl"]
  # end
  
  # def get_description_by_extracted_data(data)
  #   data["Description"]
  # end

  # # get info by symbol

  # def coin_info_by_symbol(symbol)
  #   Cryptocompare::CoinSnapshot.find(symbol, 'USD')['Data']
  # end

  # def coin_name_by_symbol(symbol)
  #   coin_info = coin_info_by_symbol(symbol)
  #   coin_info["CoinInfo"]["CoinName"]
  # end

  # def coin_full_name_by_symbol(symbol)
  #   coin_info = coin_info_by_symbol(symbol)
  #   coin_info["CoinInfo"]["FullName"]
  # end

  # def coin_bybit_trading_by_symbol(symbol)
  #   if symbol.present?
  #     symbol = symbol.upcase
  #     link_to(symbol, "https://www.bybit.com/ru-RU/trade/spot/#{symbol}/USDT", target: "_blank")
  #   end
  # end

  # def coin_website_by_symbol(symbol)
  #   coin_info = coin_info_by_symbol(symbol)
  #   coin_info["CoinInfo"]["AssetWebsiteUrl"]
  # end

  # # get info by data

  # def coin_symbol_by_data(data)
  #   data[0]
  # end

  # def coin_website_by_data(data)
  #   data[1]["AssetWebsiteUrl"]
  # end

  # def coin_name_by_data(data)
  #   data[1]["CoinName"]
  # end

  # def coin_full_name_by_data(data)
  #   data[1]["FullName"]
  # end

  # def coin_icon_by_data(data)
  #   img_url = data[1]["ImageUrl"]
  #   image_tag("https://www.cryptocompare.com#{img_url}")
  # end

  # def coin_icon(img_url)
  #   image_tag("https://www.cryptocompare.com#{img_url}")
  # end

  # def coin_name_by_snapshot(data)
  #   if data.present?
  #     img_url = data['CoinInfo']['CoinName']
  #     image_tag("https://www.cryptocompare.com#{img_url}")
  #   end
  # end

  # def img_url_by_snapshot(data)
  #   if data.present?
  #     img_url = data['CoinInfo']['ImageUrl']
  #     image_tag("https://www.cryptocompare.com#{img_url}")
  #   end
  # end

  # def price_by_snapshot(data, first_curr, second_curr)
  #   if data.present?
  #     "#{data['AggregatedData']['PRICE'].to_f.round(2)} #{second_curr}"
  #   end
  # end

  # def algorithm_by_snapshot(data)
  #   result = data['CoinInfo']
  #   if data.present? && result.present?
  #     "Алгоритм: #{result["Algorithm"]}"
  #   end
  # end

  # def total_day_volume_by_snapshot(data)
  #   result = data['AggregatedData']
  #   if data.present? && result.present?
  #     "Алгоритм: #{result["MKTCAP"]}"
  #   end
  # end

  # def coin_price(symbol=nil, currency=nil)
  #   if symbol.present?
  #     symbol = symbol.upcase
  #     if currency.present?
  #       currency = currency.upcase 
  #       price_hash = Cryptocompare::Price.find(symbol, currency)
  #       coin_price = price_hash[symbol].present? ? "#{price_hash[symbol][currency]} #{currency}" : '-'
  #     else
  #       price_hash = Cryptocompare::Price.find(symbol, 'USD')
  #       coin_price = price_hash[symbol].present? ? "#{price_hash[symbol]['USD']} USD" : '-'
  #     end
  #     return coin_price
  #   end
  # end

end
