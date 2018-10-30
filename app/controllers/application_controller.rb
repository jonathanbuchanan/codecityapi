class ApplicationController < ActionController::API
  include JsonWebToken

  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

  def render_record_not_found(error)
    #render json: {error: "record not found"}
    render json: {message: error, code: 404}, status: 404
  end

  def authenticate_request
    token = request.headers[:token]
    decoded = decode(token)
    user = User.find(decoded[:user_id])
    raise RuntimeError.new('Error authenticating request') unless user
  end
end
