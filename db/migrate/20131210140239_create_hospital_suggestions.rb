class CreateHospitalSuggestions < ActiveRecord::Migration
  def change
    create_table :hospital_suggestions do |t|
      t.integer :user_id
      t.integer :hospital_id

      t.timestamps
    end
  end
end
