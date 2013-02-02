class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end

    add_index :widgets, :title
  end
end
