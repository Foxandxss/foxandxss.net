class CreatePageInformations < ActiveRecord::Migration
  def change
    create_table :page_informations do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.integer :page_id

      t.timestamps
    end

    add_index :page_informations, [:title, :page_id], unique: true
  end
end
