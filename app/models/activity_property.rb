class ActivityProperty < ActiveRecord::Base

  belongs_to :activity
  belongs_to :activity_type

  enum_attr :activity_type, :in => [
    ['site', 1, '微官网'],
    ['vip', 2, '微会员卡'],
    ['yhq', 3, '优惠券'],
    ['ggl', 4, '刮刮乐抽奖活动'],
    ['dzp', 5, '大转盘抽奖活动']
  ]

end
