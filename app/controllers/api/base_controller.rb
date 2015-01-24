class Api::BaseController < ::AuthController

  private

  def json_errors_for(object)
    { json: object.errors.full_messages.to_json, status: :unprocessable_entity }
  end
end
