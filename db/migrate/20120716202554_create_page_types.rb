class CreatePageTypes < ActiveRecord::Migration
  def change
    create_table :page_types do |t|
      t.string :name

      t.timestamps
    end

    add_index :page_types, :name
  end
end
