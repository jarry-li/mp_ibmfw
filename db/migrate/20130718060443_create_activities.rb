class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :supplier_id, null: false, comment: '商户ID'
      t.integer :wx_mp_user_id, null: false, comment: '公众帐号ID'
      t.integer :activity_type_id, null: false, comment: '活动类型ID'
      t.string :name, null: false, comment: '活动名称'
      t.string :keyword, null: false, comment: '关键字'
      t.datetime :ready_at, null: false, comment: '活动预热时间'
      t.datetime :start_at, null: false, comment: '活动开始时间'
      t.datetime :end_at, null: false, comment: '活动停止时间'
      t.integer :status, null: false, limit: 1, default: 0, comment: '-2:已删除,-1:已终止,0:未配置,1:已配置'
      t.text :description, comment: '描述'

      t.timestamps
    end

    add_index :activities, :supplier_id
    add_index :activities, :wx_mp_user_id
    add_index :activities, :activity_type_id
    add_index :activities, :status
    add_index :activities, :keyword
  end
end
