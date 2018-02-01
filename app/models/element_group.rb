class ElementGroup < ApplicationRecord
  belongs_to :elementable, polymorphic: true
  belongs_to :sub_element
  default_scope {order('sort ASC')}
  attr_accessor :sub_element_ids
  before_save :set_sort

  def set_sort
    self.sort = elementable.name.split("_").index(sub_element.name) #if elementable.present?
  end
end
