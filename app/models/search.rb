class Search < ActiveRecord::Base
  attr_accessible :address, :lat, :lng

  has_and_belongs_to_many :specialisations
end
