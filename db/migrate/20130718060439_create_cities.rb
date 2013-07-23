class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, null: false, comment: '市名'
      t.integer :sort, null: false, default: 0, comment: '排序'

      t.timestamps
    end

    add_index :cities, :name
    add_index :cities, :sort
  end
end
