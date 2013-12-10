class CreateJoinTables < ActiveRecord::Migration
  def change
    create_table :hospitals_specialisations, id: false do |t|
      t.integer :hospital_id
      t.integer :specialisation_id
    end

    create_table :hospital_suggestions_specialisations, id: false do |t|
      t.integer :hospital_suggestion_id
      t.integer :specialisation_id
    end

    create_table :search_specialisations, id: false do |t|
      t.integer :search_id
      t.integer :specialisation_id
    end
  end
end
