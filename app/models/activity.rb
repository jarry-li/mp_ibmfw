class Activity < ActiveRecord::Base
  NOT_START = 1; WARM_UP = 2; UNDER_WAY = 3; HAS_ENDED = 4;
  NOT_START_NAME = "未开始"; WARM_UP_NAME = "预热中"; UNDER_WAY_NAME = "进行中"; HAS_ENDED_NAME = "已结束";

  DEFAULT_NOTICES = [
      { activity_type_id: 1 , title: "欢迎进入{wx_mp_user.name}的微官网", pic: "/public/uploads/activity_pics/default/site.png", description: "{supplier.name},更多精彩呈现,点击进入!", activity_status: 1 },

      { activity_type_id: 2 , title: "申请微信会员卡", pic: "/public/uploads/activity_pics/default/vip.png", description: "您尚未申请会员特权,快来点击申领吧!!", activity_status: 0 },
      { activity_type_id: 2 , title: "尊敬的会员{}", pic: "/public/uploads/activity_pics/default/vip.png", description: "尊敬的会员{},您的会员卡号为{},快来点击查看优惠信息吧!!", activity_status: 1 },

      { activity_type_id: 3 , title: "活动即将开始", pic: "/public/uploads/activity_pics/default/yhq.jpg", description: "活动说明", activity_status: 0 },
      { activity_type_id: 3 , title: "中奖公告", pic: "/public/uploads/activity_pics/default/zhongjiang.jpg", description: "你获得的SN码为:{activity_con},了解优惠券特权请点击页面查看详情~", activity_status: 1 },
      { activity_type_id: 3 , title: "活动已经结束", pic: "/public/uploads/activity_pics/default//public/uploads/activity_pics/default/jieshu.jpg", description: "亲，下次早点哦~请继续关注我们的后续活动", activity_status: -1 },

      { activity_type_id: 4 , title: "活动即将开始", pic: "/public/uploads/activity_pics/default/ggl.jpg", description: "活动说明", activity_status: 0 },
      { activity_type_id: 4 , title: "活动开始，请进入页面开始刮奖", pic: "/public/uploads/activity_pics/default/gglks.jpg", description: "请点击进入刮刮卡活动页面", activity_status: 1 },

      { activity_type_id: 5 , title: "活动开始，请进入页面开始抽奖", pic: "/public/uploads/activity_pics/default/dzp.jpg", description: "请点击进入幸运大转盘活动页面", activity_status: 1 },
      { activity_type_id: 5 , title: "活动即将开始", pic: "dzpks.jpg", description: "活动说明", activity_status: 0 }
    ]

  validates :name, :keyword, presence: true, uniqueness: { case_sensitive: false }
  validates :wx_mp_user_id, :activity_type, :ready_at, :start_at, :end_at, presence: true

  belongs_to :wx_mp_user
  belongs_to :supplier
  belongs_to :activity_type
  has_one :activity_property, dependent: :destroy
  has_one :website, dependent: :destroy
  has_one :vip_card, dependent: :destroy
  has_many :activity_notices, dependent: :destroy
  has_many :activity_properties, dependent: :destroy
  has_many :activity_consumes,dependent: :destroy
  has_many :activity_prizes, dependent: :destroy
  has_many :vip_cards

  after_create :create_default_properties!

  accepts_nested_attributes_for :activity_property
  accepts_nested_attributes_for :activity_notices
  accepts_nested_attributes_for :activity_prizes
  accepts_nested_attributes_for :website
  accepts_nested_attributes_for :vip_card

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

  def setted!
    update_attributes(status: SETTED)
  end

  def stop!
    update_attributes(status: STOPED)
  end

  def delete!
    update_attributes(status: DELETED)
  end

  def create_default_properties!
    if activity_type.id != 1 and activity_type.id != 2
      ActivityProperty.where(activity_id: id).first_or_create(activity_id: id, activity_type_id: activity_type.id)
    elsif activity_type.id != 1
      Website.where(activity_id: id).first_or_create(supplier_id: supplier.id, wx_mp_user_id: wx_mp_user.id, activity_id: id, name: wx_mp_user.name, template_id: 1, home_cover_pic: "/public/uploads/activity_pics/default/site.png")
    elsif activity_type.id != 2
      VipCard.where(activity_id: id).first_or_create(supplier_id: supplier.id, wx_mp_user_id: wx_mp_user.id, activity_id: id, name: "会员卡", background_pic: "/public/uploads/activity_pics/default/vip_background.png", logo: "/public/uploads/activity_pics/default/vip_logo.png", cover_pic: "/public/uploads/activity_pics/default/vip.png", limit_privilege_count: 8)
    end

    DEFAULT_NOTICES.each do |attrs|
      if attrs[:activity_type_id] == activity_type.id
        activity_notice = ActivityNotice.where(activity_id: id, activity_status: attrs[:activity_status]).first_or_create(wx_mp_user_id: wx_mp_user_id, activity_id: id, title: attrs[:title],pic: attrs[:pic],description: attrs[:description],activity_status: attrs[:activity_status])

      logger.info  "created activity_notice: #{activity_notice.id} - #{activity_notice.title}"
      end
    end
    if activity_type.id == 4 or activity_type.id == 5
      ['一等奖','二等奖','三等奖'].each do |title|
        activity_notice = ActivityPrize.where(activity_id: id, title: title).first_or_create(activity_id: id, title: title)
      end
    end
  end

end
