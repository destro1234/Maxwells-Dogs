class AddDateColumnToWalks < ActiveRecord::Migration
  def change
    add_column :walks, :date, :datetime
  end
end
