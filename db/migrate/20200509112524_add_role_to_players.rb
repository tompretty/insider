class AddRoleToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :role, :integer
  end
end
