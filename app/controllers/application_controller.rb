class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @jobs = Job.sort_by_interest
    @top_three_companies = Company.top_three_companies
    render :dashboard
  end
end
