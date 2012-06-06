class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :title
  # default_scope :order => 'created_at DESC'
  scope :recent, :order => 'updated_at DESC'
end
