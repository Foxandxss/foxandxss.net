class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :category_id

      t.timestamps
    end

    add_index :pages, :title
  end
end
