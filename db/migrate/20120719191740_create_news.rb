class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :content

      t.timestamps
    end

    add_index :news, :title
  end
end
