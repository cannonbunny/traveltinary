class RemoveCountryIdFromPlaces < ActiveRecord::Migration[5.2]
  def change
    remove_column :places, :country_id, :integer
  end
end
