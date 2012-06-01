# coding: utf-8
class Admin::PostsController < ApplicationController

  layout 'admin'
  before_filter :require_is_admin
  before_filter :authenticate_user! , :except => [ :show, :index ]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    # @post = Post.find(params[:id])
    @post = current_user.posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
         @facebook = Facebook.new
         @facebook.title = @post.title
         @facebook.description = @post.content
         @facebook.image_url = get_default_facebook_tag_image_url
         @facebook.site_type = get_default_facebook_tag_site_type
         @facebook.url = "/posts/" + @post.id.to_s()
         @facebook.site_name = get_default_facebook_tag_site_name
         @facebook.admins = get_default_facebook_tag_admins
         @facebook.user_id = current_user.id
         @facebook.save

        format.html { redirect_to admin_post_path(@post), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    # @post = Post.find(params[:id])
    @post = current_user.posts.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to admin_post_path(@post), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    # @post = Post.find(params[:id])
    @post = current_user.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_posts_url }
      format.json { head :no_content }
    end
  end
end
