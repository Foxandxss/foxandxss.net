class CreatePageLinks < ActiveRecord::Migration
  def change
    create_table :page_links do |t|
      t.string :title
      t.string :url
      t.integer :page_id

      t.timestamps
    end

    add_index :page_links, [:title, :page_id], unique: true
  end
end
