class UpvotesController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def create
    Upvote.create!(link_id: params[:link_id])
    # redirect_to :back
  end

  def destroy
    upvote = Upvote.find(params.fetch(:id))
    upvote.destroy
    redirect_to :back
  end
end
