class SpecialisationCategory < ActiveRecord::Base
  attr_accessible :name

  has_many :specialisations
end
