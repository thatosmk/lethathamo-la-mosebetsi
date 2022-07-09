# frozen_string_literal: true

class ApplicationService

  def self.call(*args)
    new(*args).call
  end

  class UnsuccessfulResponse < StandardError
    def initialize(msg='Something went wrong.')
      @msg = msg
    end
  end
end
