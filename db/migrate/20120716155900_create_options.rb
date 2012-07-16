class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :name, null: false
      t.string :value, null: false

      t.timestamps
    end

    add_index :options, :name, unique: true
  end
end
