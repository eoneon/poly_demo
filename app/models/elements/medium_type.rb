class MediumType < Element
  #not sure if this needs to be on superclass or subclass or either
  #has_many :mountings, as: :subable, through: :element_groups
end
