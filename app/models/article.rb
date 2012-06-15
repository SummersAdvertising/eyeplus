class Article < ActiveRecord::Base
  attr_accessible :content, :title, :excerpt_image_top
  belongs_to :board
  belongs_to :user
  has_attached_file :excerpt_image_top, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  # default_scope :order => 'created_at DESC'
  scope :recent, :order => 'updated_at DESC'
end
