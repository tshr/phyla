class Kingdom < ActiveRecord::Base
  has_many :taxonomic_units
  has_many :taxon_unit_type
end