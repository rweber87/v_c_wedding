class AddLastInitialToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :last_initial, :string
  end
end
