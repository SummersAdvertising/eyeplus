class Article < ActiveRecord::Base
  attr_accessible :content, :title, :excerpt_image_top, :excerpt_image_bottom, :top, :video_iframe_1, :video_iframe_2
  belongs_to :board
  belongs_to :user
  has_attached_file :excerpt_image_top, :styles => { :medium => "515x515>", :thumb => "100x100>" }
  has_attached_file :excerpt_image_bottom, :styles => { :medium => "515x515>", :thumb => "100x100>" }
  validates_attachment_content_type :excerpt_image_top, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :excerpt_image_bottom, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  # default_scope :order => 'created_at DESC'
  scope :recent, :order => 'updated_at DESC'
  paginates_per 5
  
  before_save :set_defaults
  
  def set_defaults
  	self.top = self.top || 'false'
  end
  
end
