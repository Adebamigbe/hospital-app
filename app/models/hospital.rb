class Hospital < ActiveRecord::Base
  attr_accessible :address, :name, :telephone, :api_id, :name, :lat, :lng, :description, :website_url

  has_many :hospital_suggestions
  has_and_belongs_to_many :specialisations
end
