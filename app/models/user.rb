class User < ApplicationRecord
  has_many :user_coins
  include ApplicationHelper
  ROLE_CEO = 'ceo'
  ROLE_DIRECTOR = 'director'
  ROLE_USER = 'user'

  scope :by_coin_symbol, ->(crypto_symbol) { where("user.user_coins.crypto_symbol = ?", crypto_symbol) if crypto_symbol }
  
  CEO_ROLES = [ROLE_CEO, ROLE_DIRECTOR, ROLE_USER]
  DIRECTOR_ROLES = [ROLE_DIRECTOR, ROLE_USER]

  def self.get_user_coins(user_id)
    UserCoin.where(user_id: user_id)
  end

  def director?
    self.role == ROLE_DIRECTOR
  end

  def ceo?
    self.role == ROLE_CEO
  end

  def role_name
    
  end
  
  def avatar
    "R"
  end

  def cover_picture
    if self.lastname.present?
      # self.lastname.upcase
      "TEST"
      # "RIYATI"
    else
      "TEST"
      # "RIYATI"
    end
  end

  def fullname
    if self.firstname.present? && self.lastname.present?
      if self.firstname == self.lastname
        "#{self.firstname}"
      else
        "#{self.firstname} #{self.lastname}"
      end
    elsif self.lastname.present?
      "#{self.lastname}"
    elsif self.firstname.present?
      "#{self.firstname}"
    else
      "Аноним"
    end
  end
  
  def short_name
    if self.firstname.present?
      "#{self.firstname}"
    else
      "Аноним"
    end
  end

  def registered_info
    "Зарегистрирован #{small_date(self.created_at)}"
  end

  def user_login_id
    "#{self.login} ##{self.id}"
  end

  def profile_id
    "#{self.login} ##{self.id}"
  end

  def get_balance
    balance = self.balance.present? ? self.balance : 0
    "Баланс #{balance}"
  end
end
