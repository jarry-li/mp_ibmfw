class Activity < ActiveRecord::Base
  NOT_START = 1; WARM_UP = 2; UNDER_WAY = 3; HAS_ENDED = 4;
  NOT_START_NAME = "未开始"; WARM_UP_NAME = "预热中"; UNDER_WAY_NAME = "进行中"; HAS_ENDED_NAME = "已结束";

  validates :name, :keyword, presence: true, uniqueness: { case_sensitive: false }
  validates :wx_mp_user_id, :activity_type, :ready_at, :start_at, :end_at, presence: true

  belongs_to :wx_mp_user
  belongs_to :supplier
  belongs_to :activity_type
  has_one :activity_property, dependent: :destroy
  has_many :activity_notices, dependent: :destroy
  has_many :activity_properties, dependent: :destroy
  has_many :activity_consumes,dependent: :destroy
  has_many :activity_prizes, dependent: :destroy
  has_many :vip_cards
  
  accepts_nested_attributes_for :activity_property
  accepts_nested_attributes_for :activity_notices
  accepts_nested_attributes_for :activity_prizes

  enum_attr :status, :in => [
    ['deleted', -2, '已删除'],
    ['stoped', -1, '已终止'],
    ['setting', 0, '未配置'],
    ['setted', 1, '已配置']
  ]

  def activity_status
  	now = Time.now
  	if now < ready_at
  		NOT_START
  	elsif now >= ready_at and now < start_at
  		WARM_UP
  	elsif now >= start_at and now < end_at
  		UNDER_WAY
  	else
  		HAS_ENDED
  	end
  end

  def activity_status_name
  	now = Time.now
  	if now < ready_at
  		NOT_START_NAME
  	elsif now >= ready_at and now < start_at
  		WARM_UP_NAME
  	elsif now >= start_at and now < end_at
  		UNDER_WAY_NAME
  	else
  		HAS_ENDED_NAME
  	end
  end

  def stop!
    update_attributes(status: STOPED)
  end

  def delete!
    update_attributes(status: DELETED)
  end

end
