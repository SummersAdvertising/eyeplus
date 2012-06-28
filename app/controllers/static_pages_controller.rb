class StaticPagesController < ApplicationController
  def introduction
  end

  def staff
  end

  def services
  end

  def home
  	@posts=Post.find(:all, :order => "updated_at desc", :limit => 3)
  	
  	@boards=Board.find(:all, :limit => 4, :order=> 'order_number asc')
  	@first_board=@boards[0]
  	@second_board=@boards[1]
  	@third_board=@boards[2]
  	@fourth_board=@boards[3]

  	@first_board_articles=@first_board.articles.find(:all, :order => "updated_at desc", :limit => 2)
  	@second_board_articles=@second_board.articles.find(:all, :order => "updated_at desc", :limit => 2)
  	@third_board_articles=@third_board.articles.find(:all, :order => "updated_at desc", :limit => 2)
  	@fourth_board_articles=@fourth_board.articles.find(:all, :order => "updated_at desc", :limit => 2)
  end
end
