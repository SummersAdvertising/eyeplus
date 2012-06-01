class Facebook < ActiveRecord::Base
  attr_accessible :admins, :description, :image_url, :site_name, :site_type, :title, :url
end
