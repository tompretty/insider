class AddWordToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :word, :string
  end
end
