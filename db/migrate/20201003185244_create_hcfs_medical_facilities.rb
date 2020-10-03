class CreateHcfsMedicalFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :hcfs_medical_facilities, id: false do |t|
      t.integer :hcf_id, null: false
      t.integer :medical_facility_id, null: false
    end

    add_index :hcfs_medical_facilities, [:hcf_id, :medical_facility_id]
  end
end
