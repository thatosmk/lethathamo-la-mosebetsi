# frozen_string_literal: true
 
class Clients::TrelloClient < Clients::Base

  attr_accessor :api_key
  attr_reader   :url

  configure do |c|
    c.api_key = Rails.application.credentials.dig(:trello, :api_key)
  end

  def initialize(url:)
    @url = url
  end

end
