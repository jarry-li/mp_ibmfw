class WxUser < ActiveRecord::Base
  validates :uid, presence: true
  
  has_many :activity_consumes
end
