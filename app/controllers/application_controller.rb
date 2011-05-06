class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticated

  def set_current_user(uid)
    session[:user_id] = uid
  end

  def current_user
    session[:user_id].blank? ? nil : User.find(session[:user_id])
  end

  def authenticated
    if(!Rails.env.test?)
      if(!session[:is_admin])
        is_authenticated = false      
        authenticate_or_request_with_http_basic do |username, password|
            if(username == RailsApn::Application.config.auth_username && password == RailsApn::Application.config.auth_password)
              is_authenticated = true
            end
        end
        if(is_authenticated)
          session[:is_admin] = true
        end
      end
    end
  end
end
