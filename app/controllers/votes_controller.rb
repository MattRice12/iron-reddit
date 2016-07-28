class VotesController < ApplicationController
  def create
    Vote.create!(link_id: params[:link_id])
    redirect_to :back
  end

  def destroy
    vote = Vote.find(params.fetch(:id))
    vote.destroy
    redirect_to :back
  end
end
