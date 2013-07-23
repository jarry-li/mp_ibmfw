class Supplier < ActiveRecord::Base
  has_secure_password

  has_many :wx_mp_users
  has_many :materials
  has_many :questions
  has_many :answers
  has_many :vip_users
  has_many :activities
  has_many :vip_cards

  def self.current
    Thread.current[:supplier]
  end

  def self.current=(supplier)
    Thread.current[:supplier] = supplier
  end

  def self.authenticate(nickname, password)
    where(nickname: nickname).first.try(:authenticate, password)
  end

  def update_sign_in_attrs_with(sign_in_ip)
    update_attributes(
      sign_in_count: sign_in_count.next,
      last_sign_in_at: current_sign_in_at,
      last_sign_in_ip: current_sign_in_ip,
      current_sign_in_at: Time.now,
      current_sign_in_ip: sign_in_ip
    )
  end
end
