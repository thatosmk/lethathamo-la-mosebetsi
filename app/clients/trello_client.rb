# frozen_string_literal: true

class TrelloClient < ApplicationClient

  include ActiveSupport::Configurable

  attr_reader \
    :base_uri,
    :url

  config_accessor \
    :api_key,
    :token

  configure do |c|
    c.api_key = Rails.application.credentials.dig(:trello, :api_key)
    c.token   = Rails.application.credentials.dig(:trello, :token)
  end

  class UnsuccessfulResponse < StandardError
    def initialize(msg='Something went wrong.')
      @msg = msg
    end
  end

  def initialize(url:)
    @base_uri = 'https://api.trello.com/1/'
    @url = url
  end

  def trello_data
    response = connection.get("#{base_uri}#{url}key=#{api_key}&token=#{token}")

    if response.status == 200
      return response.body
    else
      raise UnsuccessfulResponse
    end
  end

  def push_data(params)
    response = connection.post("#{base_uri}#{url}key=#{api_key}&token=#{token}")

    if response.status == 200
      return response.body
    else
      raise UnsuccessfulResponse
    end
  end

  private


end
