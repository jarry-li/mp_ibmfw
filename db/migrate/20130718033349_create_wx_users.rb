class CreateWxUsers < ActiveRecord::Migration
  def change
    create_table :wx_users do |t|
      t.string :uid, null: false, comment: '微信普通用户(to_user_name)'

      t.timestamps
    end
    add_index :wx_users, :uid
  end
end
