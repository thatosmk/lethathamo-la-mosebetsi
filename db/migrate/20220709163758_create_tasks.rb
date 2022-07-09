class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string   :name
      t.datetime :deadline
      t.integer  :status
      t.text     :description
      t.integer  :board_id, foreign_key: true

      t.timestamps
    end
  end
end
