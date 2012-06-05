# coding: utf-8 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
default_facebook = DefaultFacebook.new(:title => "聚英眼科診所", :description => "聚英眼科診所", :site_type => "company", :url => "www.eyeplus.com.tw", :site_name => "聚英眼科診所", :admins => "1123456")
default_facebook.save!

admin = User.new(:email => "admin@eyeplus.com.tw", :password => "123456", 
  :password_confirmation => "123456")
admin.is_admin = true
admin.save!

normal_user = User.new(:email => "user@eyeplus.com.tw", :password => "123456", 
  :password_confirmation => "123456")
normal_user.save!

