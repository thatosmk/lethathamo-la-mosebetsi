class AppServicesJob < ApplicationJob
  queue_as :default

  def perform(service_obj, opts={})
    # Do something later
    service_obj.constantize.call(**opts)
  end
end
