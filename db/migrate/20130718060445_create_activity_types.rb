class CreateActivityTypes < ActiveRecord::Migration
  def change
    create_table :activity_types do |t|
      t.string :name, null: false, comment: '类型名称'
      t.integer :sort, null: false, default: 0, comment: '排序'
      t.integer :status, limit: 1, null: false, default: 1, comment: '状态'
      t.boolean :is_show, null: false, default: false, comment: '是否显示:true显示,false不显示'
      t.text :description, comment: '描述'

      t.timestamps
    end

    # add_index :activity_types, :status
  end
end
