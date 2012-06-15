class User < ActiveRecord::Base
  has_many :posts
  has_many :questions
  has_many :answers
  has_many :articles
  has_many :boards
  has_many :facebooks
  has_many :default_facebooks
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_name
  attr_protected :is_admin, :is_super_admin
  # attr_accessible :title, :body

  def update_with_password(params={})
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) #if params[:password_confirmation].blank?
    end

    update_attributes(params)
  end

  def is_admin?
  	is_admin
  end

  def is_super_admin?
    is_super_admin
  end
end
