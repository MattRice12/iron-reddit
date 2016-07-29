class CommentDownvotesController < ApplicationController
  def create
    CommentDownvote.create!(comment_id: params[:comment_id])
    redirect_to :back
  end
end
