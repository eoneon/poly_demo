class Element < ApplicationRecord
  has_many :element_groups, as: :elementable
  has_many :sub_elements, through: :element_groups
end
