class AddColumnFriendsToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :friends, :string
  end
end
