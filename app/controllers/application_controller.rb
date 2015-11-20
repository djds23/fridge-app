class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_household
  
  def set_household
    @household = HouseHold.first
  end

  def current_household # deprecated
    HouseHold.first.id
  end
end
