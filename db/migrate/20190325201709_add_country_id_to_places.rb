class AddCountryIdToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :country_id, :integer
  end
end
