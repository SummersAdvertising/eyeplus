class Question < ActiveRecord::Base
  attr_accessible :content, :email, :is_private, :title, :user_name
  belongs_to :user
  has_many :answers, :dependent => :destroy
   validates :user_name, :presence => true
end
