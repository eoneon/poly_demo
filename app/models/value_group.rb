class ValueGroup < ApplicationRecord
  belongs_to :element_field
  belongs_to :field_value
end
