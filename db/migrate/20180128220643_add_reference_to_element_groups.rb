class AddReferenceToElementGroups < ActiveRecord::Migration[5.1]
  def change
    add_reference :element_groups, :subable, polymorphic: true
  end
end
