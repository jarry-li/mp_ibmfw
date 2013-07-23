class CreateWxRelationships < ActiveRecord::Migration
  def change
    create_table :wx_relationships do |t|
      t.integer :wx_mp_user_id, null: false, comment: '公众帐号ID'
      t.integer :wx_user_id, null: false, comment: '微信用户ID'
      t.integer :status, null: false, limit: 1, default: 1, comment: '0未关注，1关注'

      t.timestamps
    end
    
    add_index :wx_relationships, :wx_mp_user_id
    add_index :wx_relationships, :wx_user_id
    add_index :wx_relationships, :status
    
  end
end
