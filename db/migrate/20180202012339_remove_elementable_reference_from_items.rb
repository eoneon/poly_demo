class RemoveElementableReferenceFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_reference :items, :elementable
  end
end
