class VotesController < ApplicationController
  def create
    vote = Vote.new(vote_params)
    if vote.save
      redirect_to "./"
    else
      render
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:list_id)
  end
end
