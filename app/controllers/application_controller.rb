# coding: utf-8   
class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_is_admin
    unless (current_user && current_user.is_admin?)
      flash[:alert] = "You must be admin!"
      redirect_to root_path
    end
  end

  # default facebook tag values
  def get_default_facebook_tag_title
    @default_facebook_tag_title = "聚英視光眼科診所"
  end

  def get_default_facebook_tag_description
    @default_facebook_tag_description = "聚英視光眼科診所"
  end

  def get_default_facebook_tag_image_url
    @default_facebook_tag_image_url = "www.google.com" 
  end

  def get_default_facebook_tag_site_type
    @default_facebook_tag_site_type = "company"
  end

  def get_default_facebook_tag_url
    @default_facebook_tag_url = "www.google.com"
  end

  def get_default_facebook_tag_site_name
    @default_facebook_tag_site_name = "聚英視光眼科診所"
  end

  def get_default_facebook_tag_admins
    @default_facebook_tag_admins = "123456789"
  end
end
