# coding: utf-8   
class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_is_admin
    unless (current_user && current_user.is_admin?)
      flash[:alert] = "You must be admin!"
      redirect_to root_path
    end
  end

  def getFacebook(url)
    @facebook = Facebook.where(:url => url).first
    return @facebook
  end

end
