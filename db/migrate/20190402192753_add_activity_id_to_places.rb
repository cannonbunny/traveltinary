class AddActivityIdToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :activity_id, :integer
  end
end
