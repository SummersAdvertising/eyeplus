class Admin::ArticlesController < ApplicationController
  layout 'admin'
  before_filter :require_is_admin
  before_filter :authenticate_user! , :except => [ :show, :index ]
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    # @article = Article.find(params[:id])
    @board = Board.find(params[:board_id])
    @article = @board.articles.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    # @article = Article.new

    @board = Board.find(params[:board_id])
    @article = @board.articles.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    # @article = Article.find(params[:id])
    @board = Board.find(params[:board_id])
    @article = @board.articles.find(params[:id])
    @article.user_id = current_user.id
    # @article = current_user.articles.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    # @article = Article.new(params[:article])
    @board = Board.find(params[:board_id])
    @article = @board.articles.create(params[:article])
    @article.user_id = current_user.id

    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_board_path(@board), notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    # @article = Article.find(params[:id])
    @board = Board.find(params[:board_id])
    @article = @board.articles.find(params[:id])
    @article.user_id = current_user.id

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to admin_board_path(@board), notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    # @article = Article.find(params[:id])
    # @article.destroy
    @board = Board.find(params[:board_id])
    @article = @board.articles.find(params[:id])
    # @article = current_user.articles.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to admin_board_path(@board) }
      format.json { head :no_content }
    end
  end
end
