# coding: utf-8 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.new(:email => "admin@eyeplus.com.tw", :password => "123456", 
  :password_confirmation => "123456")
admin.is_admin = true
admin.save!

normal_user = User.new(:email => "user@eyeplus.com.tw", :password => "123456", 
  :password_confirmation => "123456")
normal_user.save!

super_admin = User.new(:email => "superadmin@eyeplus.com.tw", :password => "123456", 
  :password_confirmation => "123456")
super_admin.is_admin = true
super_admin.is_super_admin = true
super_admin.save!

first_board = Board.new(:name => "保護與矯正兒童視力", :order_number => 1)
first_board.save

second_board = Board.new(:name => "近視與角膜塑形術", :order_number => 2)
second_board.save

third_board = Board.new(:name => "個人化配鏡指南", :order_number => 3)
third_board.save

forth_board = Board.new(:name => "對抗老花、白內障", :order_number => 4)
forth_board.save

post = Post.new(:title => "News", :content => "News")
post.user_id = 1
post.save!

default_facebook = DefaultFacebook.new(:title => "好眼鏡、好眼睛，聚英視光眼科一手包辦", :description => "在這個眼鏡王國，幾乎找不到眼鏡行懂得眼睛的生理，也幾乎沒有眼科診所懂得配鏡必需的矯正光學，只有聚英同時擁有眼科醫師與專業視光師，用良心與專業還給您健康與舒適！", :site_type => "company", :url => "www.eyeplus.com.tw", :site_name => "聚英眼科診所", :admins => "1123456")
default_facebook.user_id = 1
default_facebook.save!

