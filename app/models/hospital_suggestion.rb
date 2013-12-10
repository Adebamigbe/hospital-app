class HospitalSuggestion < ActiveRecord::Base
  belongs_to :hospital
  belongs_to :user
  has_and_belongs_to_many :specialisations
end
