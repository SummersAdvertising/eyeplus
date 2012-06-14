class Admin::UsersController < ApplicationController
  layout 'admin'
  before_filter :require_is_admin
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    # @user = current_user.users.find(params[:id])
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    # Need to remove the password key of the params hash if it’s blank.
    # If not, Devise will fail to validate.
  	if params[:user][:password].blank?
  		params[:user].delete(:password)
  		params[:user].delete(:password_confirmation)
	  end
    @user = User.find(params[:id])
    # @user = current_user.users.find(params[:id])

    respond_to do |format|
      #for security reason, the "is_admin" field must be set as "attr_protected" in the user.rb
      #then use following codes to update a user became a admin
      # @user.is_admin=true
      # @user.save!	

      @user.email=params[:user][:email]
      @user.user_name=params[:user][:user_name]
      if params[:user][:is_admin].to_i==1
      	@user.is_admin=true
      else
      	@user.is_admin=false
      end	
      
      #if @user.update_attributes(params[:user])
      if @user.save!      	
        format.html { redirect_to admin_user_path(@user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    # @user = current_user.users.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end
end