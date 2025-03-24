module CryptosHelper
  require 'net/http'
  require 'openssl'
  require 'json'
  require 'uri'

  CMC_API_KEY = '8cde7e05-c9a8-4512-a726-3e5a2a1aa3f3'
  CMC_BASE_URL = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/info'

  MAIN_API_KEY = 'Pk5XD1r6dyttVUQVcC'
  MAIN_API_SECRET = 'aRjYkyJO2Rll8A9ka4f2xDXjhLvgdM18FtjJ'
  BASE_URL = "https://api.bybit.com"

  def generate_signature(params, secret)
    query_string = params.sort.map { |k, v| "#{k}=#{v}" }.join("&")
    OpenSSL::HMAC.hexdigest("SHA256", secret, query_string)
  end

  def send_signed_request(endpoint, params, api_key = MAIN_API_KEY, api_secret = MAIN_API_SECRET)
    params["api_key"] = api_key
    params["timestamp"] = (Time.now.to_f * 1000).to_i.to_s
    params["recv_window"] = "5000"
    params["sign"] = generate_signature(params, api_secret)
  
    uri = URI("#{BASE_URL}#{endpoint}?#{URI.encode_www_form(params)}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri)
    response = http.request(request)
    
    if response.code.to_i == 200
      return JSON.parse(response.body)
    end
  end

  def get_wallet_balance
    endpoint = "/v5/account/wallet-balance"
    response = send_signed_request(endpoint, { "accountType" => "UNIFIED" })
    response
  end

  def get_trade_history(limit = 1)
    endpoint = "/v5/execution/list"
    params = {
      "accountType" => "UNIFIED",
      "category" => "spot",
      "limit" => limit.to_s
    }
    all_trades = []
    loop do
      response = send_signed_request(endpoint, params)
      if response["retCode"] == 0
        trades = response.dig("result", "list") || []
        all_trades.concat(trades)
        cursor = response.dig("result", "nextPageCursor")
        break if cursor.nil? || trades.empty?
        params["cursor"] = cursor
      else
        nil
        break
      end
    end
    all_trades
  end

  def get_all_trade_history
    endpoint = "/v5/execution/list"
    params = {
      "accountType" => "UNIFIED",
      "category" => "spot",
    }
    all_trades = []
    loop do
      response = send_signed_request(endpoint, params)
      if response["retCode"] == 0
        trades = response.dig("result", "list") || []
        all_trades.concat(trades)
        cursor = response.dig("result", "nextPageCursor")
        break if cursor.nil? || trades.empty?
        params["cursor"] = cursor
      else
        nil
        break
      end
    end
    all_trades
  end

  def get_all_user_trade_history(user=nil)
    if user
      if user.api.present? && user.s_key.present?
        endpoint = "/v5/execution/list"
        params = {
          "accountType" => "UNIFIED",
          "category" => "spot",
          "limit" => "100"
        }
        all_trades = []
        loop do
          response = send_signed_request(endpoint, params, user.api, user.s_key)
          if response["retCode"] == 0
            trades = response.dig("result", "list") || []
            all_trades.concat(trades)
            cursor = response.dig("result", "nextPageCursor")
            break if cursor.nil? || cursor.empty? || trades.empty?
            params["cursor"] = cursor
          else
            nil
            break
          end
        end
        all_trades
      end
    else
      nil
    end
  end

  def get_user_wallet_balance(user=nil)
    if user
      if user.api.present? && user.s_key.present?
        endpoint = "/v5/account/wallet-balance"
        response = send_signed_request(endpoint, { "accountType" => "UNIFIED" }, user.api, user.s_key)
        response
      end
    else
      nil
      nil
      nil
      nil
      nil
    end
  end

  def get_user_wallet_coins(user)
    if user
      if get_user_wallet_balance(user).present?
        get_user_wallet_balance(user)["result"]["list"][0]['coin']
      end
    else
      nil
    end
  end

  def get_wallet_coins
    if get_wallet_balance.present?
      get_wallet_balance["result"]["list"][0]['coin']
    end
  end

  def get_user_total_equity(user=nil)
    data = get_user_wallet_balance(user)
    if data.present?
      if data["result"].present?
        data["result"]["list"][0]["totalEquity"].to_f.round(2)
      end
    else
      0
    end
  end

  def get_total_equity
    data = get_wallet_balance
    if data.present?
      if data["result"].present?
        data["result"]["list"][0]["totalEquity"].to_f.round(2)
      end
    else
      0
    end
  end

  def get_coin_ucid_by_symbol(symbol)
    uri = URI(CMC_BASE_URL)
    params = {
      'symbol' => symbol.upcase  # Уникальный символ монеты (например, 'BTC')
    }
  
    uri.query = URI.encode_www_form(params)
  
    request = Net::HTTP::Get.new(uri)
    request['X-CMC_PRO_API_KEY'] = CMC_API_KEY  # Ваш API ключ
  
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.request(request)
  
    if response.code.to_i == 200
      data = JSON.parse(response.body)
      
      # Получаем информацию о монете
      coin = data["data"][symbol.upcase]
      if coin
        coin_id = coin["id"]  # Получаем CoinID монеты
        return coin_id
      else
        return nil
      end
    else
      return nil
    end
  end

  def get_coin_img_by_symbol(symbol)
    ucid = get_coin_ucid_by_symbol(symbol)
    if ucid.present?
      image_tag("https://s2.coinmarketcap.com/static/img/coins/64x64/#{ucid}.png")
    end
  end

end
