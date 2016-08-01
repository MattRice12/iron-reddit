class LinksController < ApplicationController
  before_action :require_login, only: [:create, :update, :destroy]
  before_filter :disable_nav, only: [:new, :update]

  def index
    render template: 'links/index.html.erb', locals: {
      links: Link.group(:id).order("SUM(upvotes_count - downvotes_count) DESC").page(params[:page]),
      board: Board.group(:id).joins(:links).find_by("boards.id = links.board_id")
    }
  end

  def show
    if Link.exists?(params[:id])
      render template: 'links/show.html.erb', locals: {
        link: Link.find(params[:id]),
        comment: Comment.new,
        comments: Comment.group(:id).order("SUM(comment_upvotes_count - comment_downvotes_count) DESC"),
        board: Board.joins(:links).find_by("boards.id = links.board_id AND links.id = #{params[:id]}")
      }
    else
      render html: "Not Found", status: 404
    end
  end

  def new
    render locals: {
      link: Link.new,
      boards: Board.all,
      comment: Comment.new
    }
  end

  def create
    link = Link.new(link_params)
    upvote = Upvote.new(link_id: params[:link_id])
    if link.save
      upvote.save
      redirect_to root_path
    else
      flash[:alert] = "Could not be created due to errors."
      render template: 'links/new.html.erb', locals: {
        link: link,
        comment: Comment.new
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
    params.require(:link).permit(:title, :board_id)
  end

  def comment_params
    params.require(:comment).permit(:body, :link_id)
  end

  def disable_nav
    @disable_nav = true
  end
end
