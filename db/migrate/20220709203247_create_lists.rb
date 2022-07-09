class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :pos
      t.integer :board_id
      t.uuid :trello_id

      t.timestamps
    end
  end
end
