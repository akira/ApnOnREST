class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticated

  SECURITY_TOKEN = "414CwGo4sMufV2zw"

  def set_current_user(uid)
    session[:user_id] = uid
  end

  def current_user
    session[:user_id].blank? ? nil : User.find(session[:user_id])
  end

  def authenticated
    if(!Rails.env.test?)
      if(params[:token] == SECURITY_TOKEN)
        session[:is_admin] = true
      end
      if(!session[:is_admin])
        redirect_to '/'
      end
    end
  end
end
