class DefaultFacebook < ActiveRecord::Base
  attr_accessible :admins, :description, :image_url, :site_name, :site_type, :title, :url
  belongs_to :user
end
