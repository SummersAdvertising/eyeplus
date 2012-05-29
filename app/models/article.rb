class Article < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :board
end
