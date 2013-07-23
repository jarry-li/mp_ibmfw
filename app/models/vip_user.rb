class VipUser < ActiveRecord::Base
  validates :name, :mobile, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :supplier
  
  enum_attr :status, :in => [['normal',1,'正常'],['freeze',-1,'冻结']]
  
  def freeze!
    update_attributes!(:status => FREEZE)
  end
  
  def normal!
    update_attributes!(:status => NORMAL)
  end
end
