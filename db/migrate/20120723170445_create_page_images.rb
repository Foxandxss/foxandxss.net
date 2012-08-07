class CreatePageImages < ActiveRecord::Migration
  def change
    create_table :page_images do |t|
      t.string :title
      t.text :content
      t.attachment :asset
      t.integer :page_id

      t.timestamps
    end
  end
end
