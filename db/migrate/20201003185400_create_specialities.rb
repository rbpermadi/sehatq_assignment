class CreateSpecialities < ActiveRecord::Migration[6.0]
  def change
    create_table :specialities , id: false do |t|
      t.primary_key :id, :unsigned_integer, auto_increment: true
      t.string :name, limit: 50, default: "", null: false
    end
  end
end
