class BoardsController < ApplicationController
  before_filter :authenticate_user!

  def new
    
  end

  def create
    @board = Board.new(params[:board]){ |b| b.user = current_user }
    if @board.save
      redirect_to board_path(@board)
    else
      render 'new'
    end
  end
end
