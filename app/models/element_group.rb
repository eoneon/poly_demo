class ElementGroup < ApplicationRecord
  belongs_to :elementable, polymorphic: true
  #belongs_to :sub_elements
  belongs_to :subable, polymorphic: true

  #attr_accessor :sub_element_ids
  attr_accessor :subable_ids
end
