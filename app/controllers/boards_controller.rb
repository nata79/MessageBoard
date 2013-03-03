class BoardsController < ApplicationController
  def new
    
  end

  def create
    @board = Board.new params[:board]
    if @board.save
      redirect_to board_path @board
    else
      render 'new'
    end
  end
end
