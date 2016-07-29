class CommentUpvotesController < ApplicationController
  def create
    CommentUpvote.create!(comment_id: params[:comment_id])
    redirect_to :back
  end
end
