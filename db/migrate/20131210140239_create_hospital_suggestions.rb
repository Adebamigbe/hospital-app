class CreateHospitalSuggestions < ActiveRecord::Migration
  def change
    create_table :hospital_suggestions do |t|
      t.integer :user_id
      t.integer :hospital_id
      t.boolean :active, default: true
      t.string :status, default: "Pending"

      t.timestamps
    end
  end
end
