class AddVoteeToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :votee_id, :uuid
  end
end
