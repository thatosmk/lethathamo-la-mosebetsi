class AddsColsToBoards < ActiveRecord::Migration[7.0]

  def change
    add_column :boards, :trello, :jsonb, default: {}
  end

end
