# frozen_string_literal: true

class Boards::GetBoardCardsService < ApplicationService

  attr_reader \
    :board

  def initialize(board:)
    @board = board
  end

  def call
    begin
      trello_lists = TrelloClient.new(url: "/boards/#{board.trello_id}/lists?").trello_data

      trello_cards = TrelloClient.new(url: "/boards/#{board.trello_id}/cards?").trello_data

      assign_lists_to_board(trello_lists)
      assign_cards_to_lists(trello_cards)
    rescue UnsuccessfulResponse => e
      # TODO: Sent these errors to sentry
      puts e
    end
  end

  private

    def assign_lists_to_board(lists)
      lists.each do |trello_list|
        list = List.find_or_create_by(name: trello_list[:name])
        list.update(
          board:     board,
          trello_id: trello_list[:id],
          pos:       trello_list[:pos]
        )
        list.broadcast_append_to(
          board,
          :board_lists,
          target:  "frameBoardLists-#{board.id}",
          partial: 'lists/list',
          locals:  { list: list }
        )
      end
    end

    def assign_cards_to_lists(cards)
      cards.each do |card|
        list = List.find_by(trello_id: card[:idList])

        if list
          new_card = Task.find_or_create_by(name: card[:name], board_id: board.id, list_id: list.id)
         
          new_card.broadcast_append_to(
            list,
            :list_cards,
            target: "frameListCards-#{list.id}",
            partial: 'tasks/task',
            locals: { card: new_card }
          )
        end

        false
      end
    end

end
