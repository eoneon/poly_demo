class RemoveKindFromElements < ActiveRecord::Migration[5.1]
  def change
    remove_column :elements, :kind, :string 
  end
end
