class CommentsController < ApplicationController
  def create
    board = Board.find(params[:board_id])

    @comment = board.comments.create(body: params[:body], user_id: current_user.id)

    respond_to do |format|
      format.js
    end
  end

  def destroy
    comment = Comment.find(params[:id])

    comment.destroy

    redirect_back(fallback_location: root_path)
  end
end
