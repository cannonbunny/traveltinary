class AddContinentIdToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :continent_id, :integer
  end
end
