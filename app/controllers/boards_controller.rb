class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @boards = Board.all
  end

  def new
  end

  def create
    board = Board.create(title: params[:title], content: params[:content])

    redirect_to "/boards/#{board.id}"
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    board = Board.find(params[:id])
    board.update(title: params[:title], content: params[:content])

    redirect_to "/boards/#{board.id}"
  end

  def destroy
    board = Board.find(params[:id])

    board.destroy

    redirect_back(fallback_location: root_path)
  end
end
