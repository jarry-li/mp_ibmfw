class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.integer :supplier_id, null: false, comment: '商户ID'
      t.integer :wx_mp_user_id, null: false, comment: '公众帐号ID'
      t.integer :activity_id, null: false, comment: '活动ID'
      t.string :name, null: false, comment: '微官网名称'
      t.integer :template_id, null: false, comment: '页面风格模板'
      t.string :home_cover_pic, comment: '首页封面图片地址'
      t.integer :status, null: false, limit: 1, default: 1, comment: '-1停用 1启用'

      t.timestamps
    end

    add_index :websites, :supplier_id
    add_index :websites, :wx_mp_user_id
    add_index :websites, :activity_id
    add_index :websites, :status
  end
end
