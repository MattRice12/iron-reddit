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

end
