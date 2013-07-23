class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :name, null: false, comment: '省份名称'
      t.integer :sort, null: false, default: 0, comment: '排序'

      t.timestamps
    end
  end
end
