class Element < ApplicationRecord
  include Importable

  has_many :element_groups, as: :elementable
  has_many :sub_elements, through: :element_groups

  accepts_nested_attributes_for :element_groups, reject_if: proc {|attrs| attrs['sub_element_id'].blank?}, allow_destroy: true

  validates :name, presence: true

  def elementable_type=(sType)
     super(sType.to_s.classify.constantize.base_class.to_s)
  end

  def element_names
    self.elementable_type.constantize.all
  end

  # def fetched_associated_field_names
  #   sub_elements.map {|sub| sub.element_fields.map {|field| field.name }.join("")}
  # end
  #
  # def build_media_description
  #   fetched_associated_field_names.map {|field| update_field_values(field)}.join(" ")
  # end
  #
  # def update_field_values(field_name)
  #   if fetched_associated_field_names && ["leafing_kind", "remarque_kind"] == ["leafing_kind", "remarque_kind"] && field_name == "remarque_kind"
  #     properties[field_name].gsub("with ", "and ")
  #   else
  #     properties[field_name]
  #   end
  # end
end
