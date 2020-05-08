class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms, id: :uuid do |t|

      t.timestamps
    end
  end
end
