class Mounting < SubElement
  has_many :medium_types, through: :element_groups, source: :elementable, source_type: 'Element'
end
