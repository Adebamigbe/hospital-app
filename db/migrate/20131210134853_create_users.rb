class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.date :dob
      t.string :role, default: "normal"

      t.timestamps
    end
  end
end
