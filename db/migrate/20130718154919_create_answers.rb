class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :supplier_id, null: false, comment: '商户ID'
      t.integer :question_id, null: false, comment: '问题ID'
      t.integer :answer_type, null: false, limit: 1, default: 1, comment: '答复类型：1文本 2图文'
      t.integer :material_id, comment: '图文来源'
      t.text :content, comment: '文本答复'

      t.timestamps
    end

    add_index :answers, :supplier_id
    add_index :answers, :question_id
    add_index :answers, :material_id
    add_index :answers, :answer_type
  end
end
