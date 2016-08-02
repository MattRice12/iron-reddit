class DownvotesController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def create
    Downvote.create!(link_id: params[:link_id])
    redirect_to :back
  end

  def destroy
    downvote = Downvote.find(params.fetch(:id))
    downvote.destroy
    redirect_to :back
  end
end
