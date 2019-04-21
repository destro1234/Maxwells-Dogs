class AddOwnerNameColumnToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :owner_name, :string
  end
end
