class CreateItems < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :items do |t|
      t.hstore :properties
      t.integer :sku
      t.integer :retail
      t.references :elementable, polymorphic: true

      t.timestamps
    end
    add_index :items, :properties, using: :gist
  end
end
