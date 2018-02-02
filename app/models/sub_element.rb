class SubElement < ApplicationRecord
  include Importable

  has_many :element_groups, dependent: :destroy
  has_many :edition_types, through: :element_groups, source: :elementable, source_type: 'Element'
  has_many :medium_types, through: :element_groups, source: :elementable, source_type: 'Element'

  has_many :field_groups, dependent: :destroy
  has_many :element_fields, through: :field_groups

  accepts_nested_attributes_for :field_groups, reject_if: proc {|attrs| attrs['element_field_id'].blank?}, allow_destroy: true

  validates :name, presence: true

  def sub_parent
    element.name
  end

  # def index_of_parent_name
  #   medium_types.first.name.split("_").index(name) if medium_types.present?
  # end
end
