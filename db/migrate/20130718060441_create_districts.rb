class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name, null: false, comment: '区县名'
      t.integer :sort, null: false, default: 0, comment: '排序'

      t.timestamps
    end

    add_index :districts, :name
    add_index :districts, :sort
  end
end
