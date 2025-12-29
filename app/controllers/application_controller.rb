class ApplicationController < ActionController::Base
  before_action :set_locale # Set the locale to Spanish
  
  before_action :authenticate_user! # Ensure user is authenticated
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
  end 
  
  def set_locale
    I18n.locale = 'es'
  end
end
