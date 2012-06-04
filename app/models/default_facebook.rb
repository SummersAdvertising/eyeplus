class DefaultFacebook < ActiveRecord::Base
  attr_accessible :admins, :description, :site_name, :site_type, :title, :url, :excerpt_image
  belongs_to :user
  has_attached_file :excerpt_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
