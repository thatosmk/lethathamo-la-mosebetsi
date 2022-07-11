class CreateLists < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'

    create_table :lists do |t|
      t.string :name
      t.integer :pos
      t.integer :board_id
      t.string :trello_id

      t.timestamps
    end

    add_column :tasks, :list_id, :integer, foreign_key: true
  end
end
