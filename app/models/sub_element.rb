class SubElement < ApplicationRecord
  has_many :element_groups
  has_many :elements, through: :element_groups, source: :elementable, source_type: 'Element'
  has_many :element_twos, through: :element_groups, source: :elementable, source_type: 'ElementTwo'
end
