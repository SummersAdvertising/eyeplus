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
    if @facebook.nil?
      @facebook = Facebook.new
      @defaultFacebook = DefaultFacebook.first
      @facebook.title = @defaultFacebook.title
      @facebook.description = @defaultFacebook.description
      @facebook.image_url = @defaultFacebook.excerpt_image.url
      @facebook.site_type = @defaultFacebook.site_type
      @facebook.site_name = @defaultFacebook.site_name
      @facebook.admins = @defaultFacebook.admins      
    end
    @facebook.image_url = request.host_with_port+@facebook.image_url
    @facebook.url = request.host_with_port+request.original_fullpath
    return @facebook
  end

  def encodeURIComponent
    @facebook_title_encode_URI = URI.escape(@facebook.title, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    @facebook_description_encode_URI = URI.escape(@facebook.description, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    @facebook_image_url_encode_URI = URI.escape(@facebook.image_url, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    @facebook_site_type_encode_URI = URI.escape(@facebook.site_type, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    @facebook_url_encode_URI = URI.escape(@facebook.url, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    @facebook_site_name_encode_URI = URI.escape(@facebook.site_name, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    @facebook_admins_encode_URI = URI.escape(@facebook.admins, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  end
end
