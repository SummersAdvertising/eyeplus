class User < ActiveRecord::Base
  has_many :posts
  has_many :questions
  has_many :answers
  has_many :articles
  has_many :boards
  has_many :facebooks
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_protected :is_admin
  # attr_accessible :title, :body

  def is_admin?
  	is_admin
  end
end
