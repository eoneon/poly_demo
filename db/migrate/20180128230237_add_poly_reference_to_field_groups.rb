class AddPolyReferenceToFieldGroups < ActiveRecord::Migration[5.1]
  def change
    add_reference :field_groups, :subable, polymorphic: true
  end
end
