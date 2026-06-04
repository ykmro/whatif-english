class AddSlugToSituations < ActiveRecord::Migration[7.0]
  def change
    add_column :situations, :slug, :string
    add_index :situations, :slug, unique: true
  end
end
