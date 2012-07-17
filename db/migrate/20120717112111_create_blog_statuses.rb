class CreateBlogStatuses < ActiveRecord::Migration
  def change
    create_table :blog_statuses do |t|
      t.string :name, null: false
      t.string :color, null: false

      t.timestamps
    end

    add_index :blog_statuses, :name, unique: true
  end
end
