class RemoveContinentFromPlaces < ActiveRecord::Migration[5.2]
  def change
    remove_column :places, :continent, :string
  end
end
