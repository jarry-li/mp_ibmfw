class CreateWebsiteMenus < ActiveRecord::Migration
  def change
    create_table :website_menus do |t|
      t.integer :website_id, null: false, comment: '微官网ID'
      t.integer :material_id, comment: '单图文素材ID：菜单详细内容'
      t.integer :parent_id, null: false, default: 0, comment: '上级菜单ID：两级'
      t.string :name, null: false, comment: '菜单名称'
      t.integer :menu_type, null: false, limit: 1, default: 0, comment: '0素材,1页面'
      t.string :url, comment: '页面URL'      
      t.string :pic, comment: '封面图片'

      t.timestamps
    end

    add_index :website_menus, :parent_id
  end
end
