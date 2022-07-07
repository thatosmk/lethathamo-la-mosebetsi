# frozen_string_literal: true

class Clients::Base

  include ActiveSupport::Configurable

  def connection
    @_connection ||= Faraday.new(url) do |faraday|
      faraday.response :json,
        content_type: /\bjson$/,
        parser_options: { symbolize_names: true }
    end
  end

end
