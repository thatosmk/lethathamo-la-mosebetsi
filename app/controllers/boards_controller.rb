# frozen_string_literal: true

class BoardsController < ApplicationController

  def index

  end

  def show
    @board = board
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if @board.valid?
      @board.save
      redirect_to board_path(@board)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def board
      @_board ||= Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:name)
    end

end
