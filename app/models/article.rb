class Article < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :board
  belongs_to :user
  # default_scope :order => 'created_at DESC'
  scope :recent, :order => 'updated_at DESC'
end
