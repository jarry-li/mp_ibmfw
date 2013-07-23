class VipCard < ActiveRecord::Base
  
  belongs_to :supplier
  belongs_to :wx_mp_user
  belongs_to :activity
  has_many :vip_privileges
end
