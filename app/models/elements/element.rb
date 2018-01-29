class Element < ApplicationRecord
  has_many :element_groups, as: :elementable, dependent: :destroy
  #has_many :sub_elements, through: :element_groups
  has_many :mountings, through: :element_groups, source: :subable, source_type: 'SubElement'

  #accepts_nested_attributes_for :element_groups, reject_if: proc {|attrs| attrs['sub_element_id'].blank?}, allow_destroy: true
  accepts_nested_attributes_for :element_groups, reject_if: proc {|attrs| attrs['subable_id'].blank?}, allow_destroy: true

  validates :name, presence: true

  def elementable_type=(sType)
     super(sType.to_s.classify.constantize.base_class.to_s)
  end

  def element_names
    self.elementable_type.constantize.all
  end
end
