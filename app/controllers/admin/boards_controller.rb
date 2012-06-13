class Admin::BoardsController < ApplicationController
  layout 'admin'
  before_filter :require_is_admin
  before_filter :authenticate_user! , :except => [ :show, :index ]
  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @boards }
    end
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    @board = Board.find(params[:id])
    @articles = @board.articles.all    

    @boards=Board.find(:all, :limit => 4, :order=> 'order_number asc')
    
    if !@boards[0].blank?
      @first_board=@boards[0]
    else
      @first_board=@board
    end

    if !@boards[1].blank?
      @second_board=@boards[1]
    else
      @second_board=@board
    end
    
    if !@boards[2].blank?
      @third_board=@boards[2]
    else
      @third_board=@board
    end
    
    if !@boards[3].blank?
      @fourth_board=@boards[3]
    else
      @fourth_board=@board
    end    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @board }
    end
  end

  # GET /boards/new
  # GET /boards/new.json
  def new
    @board = Board.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @board }
    end
  end

  # GET /boards/1/edit
  def edit
    # @board = Board.find(params[:id])
    @board = current_user.boards.find(params[:id])
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(params[:board])
    @board.user_id = current_user.id

    respond_to do |format|
      if @board.save
        format.html { redirect_to admin_board_path(@board), notice: 'Board was successfully created.' }
        format.json { render json: @board, status: :created, location: @board }
      else
        format.html { render action: "new" }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /boards/1
  # PUT /boards/1.json
  def update
    # @board = Board.find(params[:id])
    @board = current_user.boards.find(params[:id])

    respond_to do |format|
      if @board.update_attributes(params[:board])
        format.html { redirect_to admin_board_path(@board), notice: 'Board was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    # @board = Board.find(params[:id])
    @board = current_user.boards.find(params[:id])
    @board.articles.destroy_all
    @board.destroy

    respond_to do |format|
      format.html { redirect_to admin_boards_url }
      format.json { head :no_content }
    end
  end
end
