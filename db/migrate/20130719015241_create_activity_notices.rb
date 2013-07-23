class CreateActivityNotices < ActiveRecord::Migration
  def change
    create_table :activity_notices do |t|
      t.integer :wx_mp_user_id, null: false, comment: '公众帐号ID'
      t.integer :activity_id, null: false, comment: '活动ID'
      t.string :title, comment: '活动标题'
      t.string :pic, comment: '活动图片'
      t.text :description, comment: '活动说明'
      t.integer :activity_status, null: false, limit: 1, default: 0, comment: '活动状态'

      t.timestamps
    end
    
    add_index :activity_notices, :wx_mp_user_id
    add_index :activity_notices, :activity_id
    add_index :activity_notices, :activity_status
    
  end
end
