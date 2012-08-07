class CreatePageCategories < ActiveRecord::Migration
  def change
    create_table :page_categories do |t|
      t.string :name

      t.timestamps
    end

    add_index :page_categories, :name, unique: true
  end
end
