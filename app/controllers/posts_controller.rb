class PostsController < ApplicationController
  before_filter :authenticate_user! , :except => [ :show, :index ]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    @conditionUrl = "posts"
    @facebook = Facebook.where(:url => @conditionUrl).first
    if @facebook.nil?
      @facebook = Facebook.new
      @defaultFacebook = DefaultFacebook.first
      @facebook.title = @defaultFacebook.title
      @facebook.description = @defaultFacebook.description
      @facebook.image_url = @defaultFacebook.excerpt_image.url
      @facebook.site_type = @defaultFacebook.site_type
      @facebook.url = @defaultFacebook.url
      @facebook.site_name = @defaultFacebook.site_name
      @facebook.admins = @defaultFacebook.admins
    end 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    @conditionUrl = "posts/" + @post.id.to_s()
    @facebook = Facebook.where(:url => @conditionUrl).first

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
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
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
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
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
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
