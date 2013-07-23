class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.integer :parent_id, null: false, default: 0, comment: '上级消息ID：多图文的第一条图文ID'
      t.integer :supplier_id, null: false, comment: '商户ID'
      t.integer :material_type, null: false, default: 1, comment: '1单图文 2多图文'
      t.string :title, comment: '图文标题'
      t.string :pic, comment: '图文图片'
      t.text :content, comment: '图文内容/文本消息内容'
      t.string :source_url, comment: '图文来源'
      t.text :summary, comment: '单图文摘要'
      t.text :description, comment: '描述'
      t.integer :sort, null: false, default: 0, comment: '多图文排序'

      t.timestamps
    end

    add_index :materials, :parent_id
    add_index :materials, :supplier_id
    add_index :materials, :material_type
  end
end
