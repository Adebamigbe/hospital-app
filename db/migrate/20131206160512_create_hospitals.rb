class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :api_id
      t.string :name
      t.string :address
      t.string :telephone
      t.text :description
      t.string :website_url
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
