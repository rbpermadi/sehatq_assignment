class CreateHcps < ActiveRecord::Migration[6.0]
  def change
    create_table :hcps , id: false do |t|
      t.primary_key :id, :unsigned_integer, auto_increment: true
      t.string :name, limit: 50, default: "", null: false
      t.string :image_path, limit: 255, null: true
      t.text :description, null: true
      t.integer :speciality_id, unsigned: true
      t.boolean :deleted, default: false, null: false
      t.timestamps null: false
    end

    add_index :hcps, :name
    add_index :hcps, :speciality_id
  end
end
