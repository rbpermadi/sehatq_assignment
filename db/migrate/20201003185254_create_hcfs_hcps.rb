class CreateHcfsHcps < ActiveRecord::Migration[6.0]
  def change
    create_table :hcfs_hcps, id: false do |t|
      t.integer :hcf_id, null: false
      t.integer :hcp_id, null: false
    end

    add_index :hcfs_hcps, [:hcf_id, :hcp_id]
  end
end
