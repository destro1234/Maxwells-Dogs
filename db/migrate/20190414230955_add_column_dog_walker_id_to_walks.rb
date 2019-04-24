class AddColumnDogWalkerIdToWalks < ActiveRecord::Migration
  def change
    change_table :walks, :bulk => true do |t|
  t.integer :dog_walker_id
  t.string :pickup_time
  t.remove :length
end
  end
end
