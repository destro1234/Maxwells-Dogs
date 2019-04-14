class AddColumnDogWalkerIdToWalks < ActiveRecord::Migration
  def change
    change_table :walks, :bulk => true do |t|
  t.integer :dog_walker_id
  t.time :pickup_time
  t.time :dropoff_time
  t.remove :length
end
  end
end
