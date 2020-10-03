class CreateHcfs < ActiveRecord::Migration[6.0]
  def change
    create_table :hcfs, id: false do |t|
      t.primary_key :id, :unsigned_integer, auto_increment: true
      t.string :name, limit: 50, default: "", null: false
      t.string :image_path, limit: 255, null: true
      t.text :description, null: true
      t.integer :hcf_type, unsigned: true, limit: 1
      t.string :province, limit: 50, default: "", null: false
      t.string :city,limit: 50, default: "", null: false
      t.string :district,limit: 50, default: "", null: false
      t.string :address,limit: 255, default: "", null: false
      t.decimal :latitude, precision: 10, scale: 8
      t.decimal :longitude, precision: 11, scale: 8
      t.boolean :deleted, default: false, null: false
      t.timestamps null: false
    end

    add_index :hcfs, :name
    add_index :hcfs, :hcf_type
    add_index :hcfs, :province
    add_index :hcfs, :city
    add_index :hcfs, :district
  end
end
