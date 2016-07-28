class LinksController < ApplicationController
  def index
    render template: 'lists/index.html.erb', locals: {
      lists: List.all,
    }
  end

  def show
    if List.exists?(params[:id])
      render template: 'lists/show.html.erb', locals: {
        list: List.find(params[:id])
      }
    else
      render hetml: "Not Found", status: 404
    end
  end

  def new
    render locals: {
      list: List.new
    }
  end

  def create
    list = List.new(list_params)
    if foodtruck.save
      redirect_to root_path
    else
      flash[:alert] = "Could not be created due to errors."
      render template: 'lists/new.html.erb', locals: {
        list: list
      }
    end
  end

  private
  def list_params
    params.require(:list).permit(:title)
  end
end
