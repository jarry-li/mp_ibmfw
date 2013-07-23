class CreateActivityPrizes < ActiveRecord::Migration
  def change
    create_table :activity_prizes do |t|
      t.integer :activity_id, null: false, comment: '活动ID'
      t.integer :status, null: false, limit: 1, default: 0, comment: '状态'
      t.string :title, null: false, comment: '奖项说明'
      t.string :prize, comment: '奖品设置'
      t.integer :prize_count, comment: '奖品数量'
      t.decimal :prize_rate, null: false, :precision => 10, :scale => 6, default: 0.000000, comment: '中奖概率:大于百万分之一'
      t.integer :time_limit, null: false, default: 0, comment: '多长时间不允许中该奖,0不限制'
      t.integer :limit_count, null: false, default: -1, comment: '奖品总共允许出奖次数,-1不限制'
      t.integer :day_limit_count, null: false, default: -1, comment: '奖品每天允许的出奖次数,-1不限制'
      t.integer :people_limit_count, null: false, default: -1, comment: '每人允许获得此奖品的总次数,-1不限制'
      t.integer :people_day_limit_count, null: false, default: -1, comment: '每人每天允许获得此奖品的次数,-1不限制'

      t.timestamps
    end
  end
end
