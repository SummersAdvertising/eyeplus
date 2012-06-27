class Question < ActiveRecord::Base
  attr_accessible :content, :email, :is_private, :title, :user_name
  belongs_to :user
  has_many :answers, :dependent => :destroy
  validates :user_name, :email, :presence => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
