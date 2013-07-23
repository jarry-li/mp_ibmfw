class ActivityConsume < ActiveRecord::Base
  validates :code, presence: true, uniqueness: { case_sensitive: false }
  
  belongs_to :wx_mp_user
  belongs_to :wx_user
  belongs_to :activity
  belongs_to :vip_privilege
  
  enum_attr :status, :in => [ 
    ['unissued', 0, '未发放'],
    ['not_used', 1, '未使用'],
    ['used', 2, '已使用']
  ]
  
  def used!
    update_attributes(:status => USED, use_at: Time.now)
  end
end
