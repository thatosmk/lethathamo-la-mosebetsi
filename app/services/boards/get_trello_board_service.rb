# frozen_string_literal: true

class Boards::GetTrelloBoardService < ApplicationService

  def initialize
  end

  def call
    begin
      trello_api = TrelloClient.new(url: '/members/me/boards?fields=name,url&')
      trello_board = project_board(trello_api.trello_data)

      create_board(trello_board)
    rescue UnsuccessfulResponse => e
      # TODO: Sent these errors to sentry
      puts e
    end
  end

  private

    def project_board(boards)
      boards.select do |board|
        board[:name] == 'The Pizza Project'
      end.first
    end

    def create_board(board)
      board = Board.find_or_initialize_by(name: board[:name])

      return board if board.persisted?

      board.assign_attributes(
        trello_id:   board[:id],
        trello_name: board[:name],
        trello_url:  board[:url]
      )

      return board.save if board.valid?
      false
    end

end
