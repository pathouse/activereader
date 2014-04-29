class ClippingExporter

  attr_reader :service_handler, :user

  def initialize(user, dest)
    @user = user
    @service_handler = handler_for(dest)
  end

  def export!
    @service_handler.export!
  end

  private

  def handler_for(destination)
    handler = ["ClippingExporter", destination.to_s.camelize].join("::").constantize
    handler.new(user)
  end
end

