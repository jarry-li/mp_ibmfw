class CreateActivityConsumes < ActiveRecord::Migration
  def change
    create_table :activity_consumes do |t|
      t.integer :wx_mp_user_id, null: false, comment: '公众帐号ID'
      t.integer :activity_id, null: false, comment: '活动ID'
      t.integer :wx_user_id, null: false, comment: '用户ID'
      t.integer :vip_privilege_id, comment: '特权ID'
      t.string :code, null: false, comment: '活动码'
      t.string :mobile, comment: '手机号码'
      t.integer :status, null: false, default: 0, comment: '0未发放 1已发放-未领取 2已发放-已领取'
      t.datetime :use_at, comment: '使用时间'
      t.datetime :expire_at, comment: '过期时间'
      t.text :description, comment: '描述'

      t.timestamps
    end

    add_index :activity_consumes, :wx_mp_user_id
    add_index :activity_consumes, :activity_id
    add_index :activity_consumes, :wx_user_id
    add_index :activity_consumes, :vip_privilege_id
    add_index :activity_consumes, :status
  end
end
