class FieldValue < ApplicationRecord
  include Importable
  has_many :value_groups, dependent: :destroy
  has_many :element_fields, through: :value_groups

  def substrate
    if ["canvas_kind", "paper_kind", "panel_kind"].include?(self.element_fields.first.try(:name))
      "on #{name}"
    end
  end

  def painting
    if ["paint_medium"].include?(self.element_fields.first.try(:name))
      name == "painting" ? name : "#{name} painting"
    end
  end

  def leafing
    if ["leafing_kind"].include?(self.element_fields.first.try(:name))
      "with #{name}"
    end
  end

  def remarque
    if ["remarque_kind"].include?(self.element_fields.first.try(:name))
      "with #{name}"
    end
  end
end
