class User < ActiveRecord::Base
  attr_accessible :dob, :email, :first_name, :last_name, :password, :user_id

  has_and_belongs_to_many :specialisation
  has_and_belongs_to_many :specialisation_category
end
