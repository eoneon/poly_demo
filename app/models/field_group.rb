class FieldGroup < ApplicationRecord
  belongs_to :element_field
  belongs_to :sub_element
end
