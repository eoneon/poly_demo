class AddItemizableToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :itemizable, polymorphic: true, index: true
  end
end
