class CreateVipPrivileges < ActiveRecord::Migration
  def change
    create_table :vip_privileges do |t|
      t.integer :vip_card_id, null: false, comment: '会员卡ID'
      t.string :title, null: false, comment: '标题'
      t.text :content, null: false, comment: '内容'
      t.integer :limit_count, null: false, default: 0, comment: '每人总可用次数(-1不限次数)'
      t.integer :day_limit_count, null: false, default: 0, comment: '每人每天可用次数(-1不限次数)'
      t.date :start_date, null: false, comment: '特权开始时间'
      t.date :end_date, null: false, comment: '特权结束时间'
      t.integer :status, null: false, default: 0, comment: '0未开放，1进行中，2已结束'
      t.text :description, comment: '描述'

      t.timestamps
    end

    add_index :vip_privileges, :vip_card_id
    add_index :vip_privileges, :status
  end
end
