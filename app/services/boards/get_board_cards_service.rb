# frozen_string_literal: true

class Boards::GetBoardCardsService < ApplicationService

  attr_reader \
    :board

  def initialize(board:)
    @board = board
  end

  def call
    begin
      trello_api = TrelloClient.new(url: "/boards/#{board.trello_id}/cards?")
      board_cards = trello_api.trello_data

      assign_cards_to_board(board_cards)
    rescue UnsuccessfulResponse => e
      # TODO: Sent these errors to sentry
      puts e
    end
  end

  private

    def assign_cards_to_board(cards)
      cards.each do |card|
        list = List.find_by(trello_id: card[:idList])

        new_card = Task.new(card[:name], board: board, list: list)
        return new_card.save if new_card.valid?

        false
      end
    end

end
