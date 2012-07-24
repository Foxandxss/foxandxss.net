class CreatePageImages < ActiveRecord::Migration
  def change
    create_table :page_images do |t|
      t.string :title
      t.text :content
      t.string :url, null: false
      t.integer :page_id

      t.timestamps
    end

    remove_column :pages, :image
  end
end
