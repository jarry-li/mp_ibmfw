class CreateVipUsers < ActiveRecord::Migration
  def change
    create_table :vip_users do |t|
      t.integer :supplier_id, null: false, comment: '商户ID'
      t.integer :wx_mp_user_id, null: false, comment: '公众帐号ID'
      t.integer :wx_user_id, null: false, comment: '微信用户ID'
      t.string :name, null: false, comment: '会员名'
      t.string :mobile, null: false, comment: '手机号'
      t.string :address, comment: '地区'
      t.integer :status, null: false, limit: 1, default: 1, comment: '1正常 -1冻结'

      t.timestamps
    end

    add_index :vip_users, :supplier_id
    add_index :vip_users, :wx_mp_user_id
    add_index :vip_users, :wx_user_id
    add_index :vip_users, :status
  end
end
