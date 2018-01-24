class ElementGroup < ApplicationRecord
  belongs_to :elementable, polymorphic: true
  belongs_to :sub_element
  attr_accessor :sub_element_ids
end
