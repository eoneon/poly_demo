class Element < ApplicationRecord
  has_many :element_groups, as: :elementable
  has_many :sub_elements, through: :element_groups

  def elementable_type=(sType)
     super(sType.to_s.classify.constantize.base_class.to_s)
  end
end
