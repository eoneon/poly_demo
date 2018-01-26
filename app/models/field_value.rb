class FieldValue < ApplicationRecord
  include Importable
  has_many :value_groups, dependent: :destroy
  has_many :element_fields, through: :value_groups
end
