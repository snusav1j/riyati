class ApplicationController < ActionController::Base
  require 'telegram/bot'
  # require 'money'
  include ApplicationHelper
  include CryptosHelper

  # Telegram::TOKEN
  # Telegram::CHAT_ID
  # allow_browser versions: :modern

  helper_method :current_user
  before_action :set_global_vars
  before_action :set_cache_headers
  before_action :create_super_user

  def send_tg_message_to_dev(msg)
    chat_id = "6393964092"
    token = "7680590872:AAGfpNQc5tJO8UKASClsx1rOzBDsvRk_9zc"
    Telegram::Bot::Client.run(token) do |bot|
      bot.api.send_message(chat_id: chat_id, text: msg)
    end
  end

  def send_tg_message(msg)
    token = "7680590872:AAGfpNQc5tJO8UKASClsx1rOzBDsvRk_9zc"
    chat_id = current_user.tg_chat_id

    if chat_id
      Telegram::Bot::Client.run(token) do |bot|
        bot.api.send_message(chat_id: chat_id, text: msg)
      end
    end
  end

  def create_super_user
    user_present = User.find_by(login: "riyati")
    if !user_present.present?
      User.create(login: 'riyati', password: 555, role: 'dev', firstname: 'riyati')
    end
  end
  
  def set_global_vars
    @http_host = request.env['HTTP_HOST']
    @cur_url = request.env['REQUEST_URI']
		@ref_url = request.env['HTTP_REFERER']
  end

  def ensure_current_user
    if current_user.nil?
      session[:prev_cur_url] = @cur_url
      redirect_to new_session_path
    end
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

  private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Mon, 01 Jan 1990 00:00:00 GMT"
  end
end
