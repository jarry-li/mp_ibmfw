class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name, comment: '商户名称'
      t.string :nickname, null: false, comment: '系统登录用户名'
      t.string :mobile, comment: '手机号码'
      t.string :tel, comment: '电话'
      t.integer :status, comment: '状态', null: false, default: 0
      t.integer :supplier_category_id, comment: '商家类别ID'
      t.integer :province_id, comment: '省份ID'
      t.integer :city_id, comment: '城市ID'
      t.integer :district_id, comment: '地区ID'
      t.string :address, comment: '详细地址'
      t.integer :sign_in_count, null: false, default: 0, comment: '登录次数'
      t.datetime :current_sign_in_at, comment: '当前登录时间'
      t.string :current_sign_in_ip, comment: '当前登录ip'
      t.datetime :last_sign_in_at, comment: '上次登录时间'
      t.string :last_sign_in_ip, comment: '上次登录ip'
      t.string :password_digest, null: false, comment: '系统登录密码'
      t.text :description, comment: '描述'

      t.timestamps
    end

    add_index :suppliers, :name
    add_index :suppliers, :nickname
    add_index :suppliers, :status
    add_index :suppliers, :supplier_category_id
    add_index :suppliers, :province_id
    add_index :suppliers, :city_id
    add_index :suppliers, :district_id
  end
end
