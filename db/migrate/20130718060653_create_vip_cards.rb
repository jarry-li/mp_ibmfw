class CreateVipCards < ActiveRecord::Migration
  def change
    create_table :vip_cards do |t|
      t.integer :supplier_id, null: false, comment: '商户ID'
      t.integer :wx_mp_user_id, null: false, comment: '公众帐号ID'
      t.integer :activity_id, null: false, comment: '活动ID'
      t.string :name, null: false, comment: '会员卡名称'
      t.string :background_pic, null: false, comment: '背景图片（图片地址）'
      t.string :logo, null: false, comment: '品牌商标（图片地址）'
      t.string :cover_pic, null: false, comment: '封面图片（图片地址）'
      t.integer :limit_privilege_count, null: false, limit: 1, default: 0, comment: '特权数量限制'
      t.integer :status, null: false, limit: 1, default: 1, comment: '状态'
      t.text :description, comment: '描述'

      t.timestamps
    end

    add_index :vip_cards, :supplier_id
    add_index :vip_cards, :wx_mp_user_id
    add_index :vip_cards, :activity_id
    add_index :vip_cards, :status
  end
end
