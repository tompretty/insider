class AddNextRoomToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :next_room_id, :uuid
  end
end
