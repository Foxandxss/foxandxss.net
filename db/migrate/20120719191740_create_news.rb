class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end

    add_index :news, :title
  end
end
