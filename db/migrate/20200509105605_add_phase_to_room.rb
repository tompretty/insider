class AddPhaseToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :phase, :integer, default: 0
  end
end
