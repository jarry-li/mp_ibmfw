class CreateWxMpUsers < ActiveRecord::Migration
  def change
    create_table :wx_mp_users do |t|
      t.integer :supplier_id, null: false, comment: '商家ID'
      t.integer :status, null: false, limit: 1, default: 0, comment: '状态(0:未设置,1:开启, -1:关闭)'
      t.string :name, null: false, comment: '公众帐号名称'
      t.string :uid, comment: '公众帐号OpenID(from_user_name)'
      t.string :token, comment: '安全性验证串'
      t.string :url, comment: '提供给微信的接口地址'
      t.text :welcome_msg, comment: '欢迎语'
      t.string :mobile, comment: '手机号码'
      t.string :tel, comment: '电话'
      t.integer :supplier_category_id, comment: '商家类别ID'
      t.integer :province_id, comment: '省份ID'
      t.integer :city_id, comment: '城市ID'
      t.integer :district_id, comment: '地区ID'
      t.string :address, comment: '详细地址'
      t.text :description, comment: '描述'

      t.timestamps
    end
    add_index :wx_mp_users, :supplier_id
    add_index :wx_mp_users, :status
    add_index :wx_mp_users, :name
    add_index :wx_mp_users, :uid
    add_index :wx_mp_users, :supplier_category_id
    add_index :wx_mp_users, :province_id
    add_index :wx_mp_users, :city_id
    add_index :wx_mp_users, :district_id
  end
end
