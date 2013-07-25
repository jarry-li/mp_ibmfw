class WxMpUser < ActiveRecord::Base
  validates :supplier_id, :status, presence: true
  validates :name, presence: { message: '不能为空' }, uniqueness: { case_sensitive: false }

  belongs_to :supplier
  has_many :questions
  has_many :activity_consumes
  has_many :vip_cards,dependent: :destroy

  enum_attr :status, :in => [
    ['pending', 0, '待激活'],
    ['active', 1, '开启'],
    ['froze', -1, '已冻结']
  ]

  before_create { generate_token(:token) }
  after_create :generate_url, :create_default_activities

  private

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while WxMpUser.exists?(column => self[column])
  end

  def generate_url
    update_attributes(url: "http://www.uzhe.com/api/service?id=#{id}")
  end

  def create_default_activities
    now = Time.now
    attrs = [
      {
        supplier_id: supplier_id,
        wx_mp_user_id: id,
        activity_type_id: 1,
        name: "我的微官网",
        keyword: "微官网",
        ready_at: now,
        start_at: now,
        end_at: now+100.years
      },
      {
        supplier_id: supplier_id,
        wx_mp_user_id: id,
        activity_type_id: 2,
        name: "我的微会员卡",
        keyword: "会员卡",
        ready_at: now,
        start_at: now,
        end_at: now+100.years
      }
    ]
    Activity.create(attrs)
  end
end
