# frozen_string_literal: true

class BoardsController < ApplicationController

  def index
    # find_trello_boards
    @boards ||= Board.all

    respond_to do |format|
      format.html
      format.json { render json: @boards.to_json }
    end
   end

  def show
    #fetch_cards_for_board
    @board = board

    respond_to do |format|
      format.html
      format.json { render json: @board.to_json }
    end
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

    def find_trello_boards
      @_find_trello_boards ||= AppServicesJob.perform_later(
        'Boards::GetTrelloBoardService'
      )
    end

    def fetch_cards_for_board
      @_fetch_cards_for_board ||= AppServicesJob.perform_later(
        'Boards::GetBoardCardsService',
        { board: board }
      )
    end

end
