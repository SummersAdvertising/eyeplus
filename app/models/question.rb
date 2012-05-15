class Question < ActiveRecord::Base
  attr_accessible :content, :email, :is_private, :title
  belongs_to :user
  has_many :answers, :dependent => :destroy
end
