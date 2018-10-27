class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

  def render_record_not_found(error)
    #render json: {error: "record not found"}
    render json: {message: error, code: 404}, status: 404
  end
end
