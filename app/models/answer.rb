class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :supplier
  acts_as_enum :answer_type, :in => [['text',1,'文本'],['image_text',2,'图文']]
end
