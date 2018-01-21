class AddSubElementRefToElementGroups < ActiveRecord::Migration[5.1]
  def change
    add_reference :element_groups, :sub_element, foreign_key: true
  end
end
