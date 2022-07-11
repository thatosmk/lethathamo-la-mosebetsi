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

    def create_board(trello_board)
      board = Board.find_or_initialize_by(name: trello_board[:name])

      return board if board.persisted?

      board.assign_attributes(
        trello_id:   trello_board[:id],
        trello_name: trello_board[:name],
        trello_url:  trello_board[:url]
      )

      if board.valid?
        board.save
        board.broadcast_append_to(
          :boards_stream,
          target:  :frameBoards,
          partial: 'boards/board',
          locals:  { board: board }
        )
      end
      false
    end

end
