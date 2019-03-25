class AddCountryIdToContinents < ActiveRecord::Migration[5.2]
  def change
    add_column :continents, :country_id, :integer
  end
end
