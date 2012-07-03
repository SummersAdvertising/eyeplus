class Admin::DefaultFacebooksController < ApplicationController
  layout 'admin'
  before_filter :require_is_admin
  # GET /default_facebooks
  # GET /default_facebooks.json
  def index
    @default_facebooks = DefaultFacebook.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @default_facebooks }
    end
  end

  # GET /default_facebooks/1
  # GET /default_facebooks/1.json
  def show
    @default_facebook = DefaultFacebook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @default_facebook }
    end
  end

  # GET /default_facebooks/new
  # GET /default_facebooks/new.json
  def new
    @default_facebook = DefaultFacebook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @default_facebook }
    end
  end

  # GET /default_facebooks/1/edit
  def edit
    @default_facebook = DefaultFacebook.find(params[:id])
  end

  # POST /default_facebooks
  # POST /default_facebooks.json
  def create
    @default_facebook = DefaultFacebook.new(params[:default_facebook])
    @default_facebook.user_id = current_user.id

    respond_to do |format|
      if @default_facebook.save
        format.html { redirect_to [:admin,@default_facebook], notice: 'Default facebook was successfully created.' }
        format.json { render json: @default_facebook, status: :created, location: @default_facebook }
      else
        format.html { render action: "new" }
        format.json { render json: @default_facebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /default_facebooks/1
  # PUT /default_facebooks/1.json
  def update
    @default_facebook = DefaultFacebook.find(params[:id])
    # @default_facebook = current_user.default_facebooks.find(params[:id])

    respond_to do |format|
      if @default_facebook.update_attributes(params[:default_facebook])
        format.html { redirect_to [:admin,@default_facebook], notice: 'Default facebook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @default_facebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /default_facebooks/1
  # DELETE /default_facebooks/1.json
  def destroy
    # @default_facebook = DefaultFacebook.find(params[:id])
    @default_facebook = current_user.default_facebooks.find(params[:id])
    @default_facebook.destroy

    respond_to do |format|
      format.html { redirect_to admin_default_facebooks_url }
      format.json { head :no_content }
    end
  end
end
