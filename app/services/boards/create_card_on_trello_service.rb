# frozen_string_literal: true

class Boards::CreateCardOnTrelloService < ApplicationService

  attr_reader \
    :board,
    :card

  def initialize(board:, list: ,card:)
    @board = board
    @card  = card
    @list  = list
  end

  def call
    begin
      trello_api = TrelloClient.new(url: "/cards?idList=#{list.trello_id}&")

      trello_api.push_data(card)
    rescue UnsuccessfulResponse => e
      # TODO: Sent these errors to sentry
      puts e
    end
  end

  private

end
