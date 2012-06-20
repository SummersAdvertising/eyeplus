# coding: utf-8   
class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_is_admin
    unless (current_user && current_user.is_admin?)
      flash[:alert] = "You must be admin!"
      redirect_to root_path
    end
  end

  def require_is_super_admin
    unless (current_user && current_user.is_super_admin?)
      flash[:alert] = "You must be super admin!"
      redirect_to root_path
    end
  end

  def getFacebook(url)
    @facebook = Facebook.where(:url => url).first
    return @facebook
  end

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'edit'
      "admin"
    else
      "application"
    end
  end

  def get_four_boards(board)
    @board=board

    @boards=Board.find(:all, :limit => 4, :order=> 'order_number asc')
    
    if !@boards[0].blank?
      @first_board=@boards[0]
    else
      @first_board=@board
    end

    if !@boards[1].blank?
      @second_board=@boards[1]
    else
      @second_board=@board
    end
    
    if !@boards[2].blank?
      @third_board=@boards[2]
    else
      @third_board=@board
    end
    
    if !@boards[3].blank?
      @fourth_board=@boards[3]
    else
      @fourth_board=@board
    end  
  end

  # def encodeURIComponent
  #   @facebook_title_encode_URI = URI.escape(@facebook.title, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  #   @facebook_description_encode_URI = URI.escape(@facebook.description, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  #   @facebook_image_url_encode_URI = URI.escape(@facebook.image_url, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  #   @facebook_site_type_encode_URI = URI.escape(@facebook.site_type, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  #   @facebook_url_encode_URI = URI.escape(@facebook.url, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  #   @facebook_site_name_encode_URI = URI.escape(@facebook.site_name, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  #   @facebook_admins_encode_URI = URI.escape(@facebook.admins, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  # end
end
