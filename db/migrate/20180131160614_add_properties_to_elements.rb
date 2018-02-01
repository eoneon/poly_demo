class AddPropertiesToElements < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    add_column :elements, :properties, :hstore

    add_index :elements, :properties, using: :gist
  end
end
