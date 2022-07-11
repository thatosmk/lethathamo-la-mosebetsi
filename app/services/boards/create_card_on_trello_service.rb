# frozen_string_literal: true

class Boards::CreateCardOnTrelloService < ApplicationService

  attr_reader \
    :list,
    :card

  def initialize(list:, card:)
    @card  = card
    @list  = list
  end

  def call
    begin
      trello_api = TrelloClient.new(url: "/cards?idList=#{list.trello_id}&name=#{card.name}&")

      trello_api.push_data(card)
    rescue UnsuccessfulResponse => e
      # TODO: Sent these errors to sentry
      puts e
    end
  end

  private

end
