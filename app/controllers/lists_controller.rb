# frozen_string_literal: true

class ListsController < ApplicationController

  def new
    @board ||= board
  end

  def create
    @board = board
    @list = board.lists.build(list_params)

    if @list.valid?
      # @list.save
      # Boards::CreateCardOnTrelloService.call(board: board, card: task)
      redirect_to board_path(board)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def board
      @_board ||= Board.find(params[:board_id])
    end

    def list_params
      params.require(:list).permit(:name, :board_id)
    end
end
