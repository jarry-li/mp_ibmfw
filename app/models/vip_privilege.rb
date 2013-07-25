class VipPrivilege < ActiveRecord::Base
  validates :title, :content, :limit_count, :day_limit_count, :start_date, :end_date, presence: true
  belongs_to :vip_card
  has_many :activity_consumes
  
  enum_attr :status, :in => [
    ['not_open', 0, '未开放'],
    ['under_way', 1, '进行中'],
    ['has_ended', 2, '已结束']
  ]
end
