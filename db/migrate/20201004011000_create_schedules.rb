class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules, id: false do |t|
      t.primary_key :id, :unsigned_integer, auto_increment: true
      t.integer :hcf_id, null: false, default: 0
      t.integer :hcp_id, null: false, default: 0
      t.string :day, limit: 3, null: false
      t.time :time_start, null: false
      t.time :time_end, null: false
      t.boolean :deleted, default: false, null: false
      t.timestamps
    end

    add_index :schedules, :day
    add_index :schedules, :time_start
    add_index :schedules, :time_end
    add_index :schedules, :hcf_id
    add_index :schedules, :hcp_id
    add_index :schedules, [:day, :hcf_id, :hcp_id]
  end
end
