class Board < ActiveRecord::Base
  attr_accessible :name, :order
  has_many :articles
end
