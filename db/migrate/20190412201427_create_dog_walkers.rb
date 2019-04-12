class CreateDogWalkers < ActiveRecord::Migration
  def change
    create_table :dog_walkers do |t|
      t.string :name
      t.string :username
      t.string :password_digest
    end
  end
end
