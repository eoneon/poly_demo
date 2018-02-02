class RemoveElementableTypeFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :elementable_type
  end
end
