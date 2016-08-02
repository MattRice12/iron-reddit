class CommentUpvotesController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def create
    CommentUpvote.create!(comment_id: params[:comment_id])
    redirect_to :back
  end
end
