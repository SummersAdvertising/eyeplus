class DefaultFacebook < ActiveRecord::Base
  attr_accessible :admins, :description, :site_name, :site_type, :title, :url
  belongs_to :user
end
