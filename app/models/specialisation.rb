class Specialisation < ActiveRecord::Base
  attr_accessible :name
  attr_accessor :show_checked

  belongs_to :specialisation_category
  has_and_belongs_to_many :hospitals
  has_and_belongs_to_many :hospital_suggestions
  has_and_belongs_to_many :searches
end
