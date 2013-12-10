class CreateSpecialisations < ActiveRecord::Migration
  def change
    create_table :specialisations do |t|
      t.integer :specialisation_category_id
      t.string :name

      t.timestamps
    end
  end
end
