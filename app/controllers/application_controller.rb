class ApplicationController < ActionController::Base
  include ApplicationHelper
  require 'rails_charts'

  # allow_browser versions: :modern
  helper_method :current_user
  before_action :set_global_vars
  before_action :set_cache_headers
  before_action :create_super_user

  def create_super_user
    user_present = User.find_by(login: "riyati")
    if !user_present.present?
      User.create(login: 'riyati', password: 555, role: 'ceo', firstname: 'riyati')
    end
  end

  def set_global_vars
    @cur_url = request.env['REQUEST_URI']
		@ref_url = request.env['HTTP_REFERER']
  end

  def ensure_current_user
    if current_user.nil?
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
