class Material < ActiveRecord::Base
  mount_uploader :pic, MaterialUploader

  validates :title, :content, presence: true

  enum_attr :material_type, :in => [ ['single_graphic', 1, '单图文'], ['multiple_graphic', 2, '多图文'] ]

  belongs_to :supplier
end
