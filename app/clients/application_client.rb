# frozen_string_literal: true

class ApplicationClient

  include ActiveSupport::Configurable

  def connection
    @_connection ||= Faraday.new(url) do |faraday|
      faraday.headers['Content-Type'] = 'application/json'

      faraday.response :json,
        content_type: /\bjson$/,
        parser_options: { symbolize_names: true }

      faraday.adapter :net_http
    end
  end

end
