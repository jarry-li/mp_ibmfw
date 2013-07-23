class CreateSupplierCategories < ActiveRecord::Migration
  def change
    create_table :supplier_categories do |t|
      t.integer :parent_id, null: false, default: 0, comment: '上级分类ID'
      t.string :name, null: false, comment: '商户分类名称'
      t.integer :sort, null: false, default: 0, comment: '排序'
      t.integer :status, limit: 1, null: false, default: 1, comment: '状态：0停用，1使用'

      t.timestamps
    end

    # add_index :supplier_categories, :parent_id
    # add_index :supplier_categories, :status
  end
end
