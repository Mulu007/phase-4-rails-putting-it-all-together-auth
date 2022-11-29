class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid
  # run authorize method before you do anything else unless it meets skips_before_action method in any child component
  before_action :authorize


  private

  def handle_invalid(exception)
    render json: {errors: exception.record.errors.full_messages}, status: 422
  end

  def authorize
    @current_user = User.find_by(id: session[:user_id])
    render json: {errors: ["Not authorized"]}, status: 401 unless @current_user
  end

  end
