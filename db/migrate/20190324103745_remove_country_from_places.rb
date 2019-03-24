class RemoveCountryFromPlaces < ActiveRecord::Migration[5.2]
  def change
    remove_column :places, :country, :string
  end
end
