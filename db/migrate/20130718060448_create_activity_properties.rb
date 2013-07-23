class CreateActivityProperties < ActiveRecord::Migration
  def change
    create_table :activity_properties do |t|
      t.integer :activity_id, null: false, comment: '活动ID'
      t.integer :activity_type_id, null: false, comment: '活动类型ID'
      t.string :prize_pic, comment: '中奖图片(抽奖)'
      t.integer :partake_limit, null: false, default: -1, comment: '每人参与的总次数(抽奖)'
      t.integer :day_partake_limit, null: false, default: -1, comment: '每人每天可参与次数(抽奖)'
      t.integer :prize_limit, null: false, default: -1, comment: '每人中奖的总次数(抽奖)'
      t.integer :day_partake_limit, null: false, default: -1, comment: '每人每天可中奖的次数(抽奖)'
      t.string :item_name, comment: '商品名称(团购)'
      t.text :special_warn, comment: '特别提醒(团购)'
      t.integer :min_people_num, null: false, default: 0, comment: '最低成团人数(团购)'
      t.decimal :coupon_price, null: false, :precision => 12, :scale => 2, default: 0.00, comment: '团购价格(团购)'
      t.decimal :item_price, null: false, :precision => 12, :scale => 2, default: 0.00, comment: '商品原始价格(团购)'
      t.integer :coupon_count, null: false, default: 0, comment: '优惠券发放总数(优惠券)'
      t.integer :get_limit_count, null: false, default: 0, comment: '每人允许领取数(优惠券)'
      t.string :repeat_draw_msg, comment: '重复抽奖回复(优惠券)'

      t.timestamps
    end

    add_index :activity_properties, :activity_id
    add_index :activity_properties, :activity_type_id
  end
end
