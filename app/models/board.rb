class Board < ActiveRecord::Base
  attr_accessible :name, :order, :excerpt_image
  has_many :articles
  has_attached_file :excerpt_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
