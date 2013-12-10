class CreateSpecialisationCategories < ActiveRecord::Migration
  def change
    create_table :specialisation_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
