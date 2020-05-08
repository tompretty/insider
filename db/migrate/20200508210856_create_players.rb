class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :room, null: false, foreign_key: true, type: :uuid
      t.string :name

      t.timestamps
    end
  end
end
