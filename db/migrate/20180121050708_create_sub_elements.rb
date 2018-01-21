class CreateSubElements < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_elements do |t|
      t.string :name

      t.timestamps
    end
  end
end
