class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :supplier_id, null: false, comment: '商户ID'
      t.integer :wx_mp_user_id, null: false, comment: '公众帐号ID'
      t.integer :match_type, null: false, limit: 1, default: 1, comment: '匹配类型：1全匹配，2模糊匹配'
      t.string :ask, comment: '问:微信用户发送的消息'

      t.timestamps
    end

    add_index :questions, :supplier_id
    add_index :questions, :wx_mp_user_id
    add_index :questions, :match_type
  end
end
