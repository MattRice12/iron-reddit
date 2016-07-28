class LinksController < ApplicationController
  def index
    render template: 'links/index.html.erb', locals: {
      links: Link.all.order(votes_count: :desc, title: :desc).page(params[:page])
    }
  end

  def show
    if Link.exists?(params[:id])
      render template: 'links/show.html.erb', locals: {
        link: Link.find(params[:id])
      }
    else
      render html: "Not Found", status: 404
    end
  end

  def new
    render locals: {
      link: Link.new
    }
  end

  def create
    link = Link.new(link_params)
    vote = Vote.new(link_id: params[:link_id])
    if link.save
      vote.save
      redirect_to root_path
    else
      flash[:alert] = "Could not be created due to errors."
      render template: 'links/new.html.erb', locals: {
        link: link,
      }
    end
  end

  def edit
    render locals: {
      link: Link.find(params.fetch(:id))
    }
  end

  def update
    link = Link.find(params.fetch(:id))
    if link.update(link_params)
      redirect_to root_path
    else
      flash[:alert] = "Could not be edited due to errors."
      render template: 'links/edit.html.erb', locals: {
        link: link
      }
    end
  end

  def destroy
    link = Link.find(params.fetch(:id))
    link.destroy
    redirect_to root_path, :notice => "Your link has been deleted"
  end

  private
  def link_params
    params.require(:link).permit(:title)
  end
end
