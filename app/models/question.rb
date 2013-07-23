class Question < ActiveRecord::Base
  validates :ask, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :wx_mp_user
  belongs_to :supplier
  has_many :answers, dependent: :destroy
  
  acts_as_enum :match_type, :in => [['full_match',1,'全匹配'],['fuzzy_match',2,'模糊匹配']]
end
