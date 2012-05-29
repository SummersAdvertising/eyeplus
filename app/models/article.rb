class Article < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :board
  belongs_to :user
end
