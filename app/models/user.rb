class User < ActiveRecord::Base
  attr_accessible :dob, :email, :first_name, :last_name, :password, :password_confirmation, :role

  validates :email, presence: true, uniqueness: true

  has_secure_password
  has_and_belongs_to_many :specialisation
  has_and_belongs_to_many :specialisation_category

  def role?(r)
    self.role == r.to_s
  end
end
