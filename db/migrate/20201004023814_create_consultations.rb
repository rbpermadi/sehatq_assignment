class CreateConsultations < ActiveRecord::Migration[6.0]
  def change
    create_table :consultations, id: false do |t|
      t.primary_key :id, :unsigned_integer, auto_increment: true
      t.integer :schedule_id, null: false, default: 0
      t.integer :user_id, null: false, default: 0
      t.date :date, null: false
      t.boolean :deleted, default: false, null: false
      t.timestamps
    end

    add_index :consultations, :schedule_id
    add_index :consultations, :user_id
  end
end
