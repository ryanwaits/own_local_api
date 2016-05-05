class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  # render JSON error message
  def not_found(exception)
      respond_to do |format|
        format.any { render json: {error: exception.message, status: 400}, status: :not_found }
      end
  end
end
