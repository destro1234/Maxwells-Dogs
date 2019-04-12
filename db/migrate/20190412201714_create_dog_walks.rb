class CreateDogWalks < ActiveRecord::Migration
  def change
    create_table :dog_walks do |t|
      t.integer :dog_id
      t.integer :walk_id
    end
  end
end
