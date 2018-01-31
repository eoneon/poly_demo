class ElementField < ApplicationRecord
  include Importable
  
  has_many :field_groups, dependent: :destroy
  has_many :sub_elements, through: :field_groups

  has_many :value_groups, dependent: :destroy
  has_many :field_values, through: :value_groups

  accepts_nested_attributes_for :field_groups, reject_if: proc {|attrs| attrs['element_field_id'].blank?}, allow_destroy: true
  accepts_nested_attributes_for :field_values, reject_if: proc {|attrs| attrs['name'].blank?}, allow_destroy: true
end
