class VotesController < ApplicationController
  def create
    Vote.create!(link_id: params[:link_id])
    redirect_to :back
  end

  def destroy ### WHY DID THIS STOP WORKING
    vote = Vote.find(params.fetch(:id))
    # vote = Vote.where(link_id: link.id)
    vote.destroy
    redirect_to :back
  end

end
