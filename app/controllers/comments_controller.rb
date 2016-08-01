class CommentsController < ApplicationController
  before_action :require_login, only: [:create, :update, :destroy]
  before_filter :disable_nav, only: [:new, :update]
  def index
    render template: 'comments/index.html.erb', locals: {
      comments: Comment.group(:id).order("SUM(comment_upvotes_count - comment_downvotes_count) DESC").page(params[:page])
    }
  end

  def show
    if Comment.exists?(params[:id])
      render template: 'comments/show.html.erb', locals: {
        comment: Comment.where(id: params[:id])
      }
    else
      render html: "Not Found", status: 404
    end
  end

  def new
    render locals: {
      comment: Comment.new
    }
  end

  def create
    comment = Comment.new(comment_params)
    comment_upvote = CommentUpvote.new(comment_id: params[:comment_id])
    if comment.save
      comment_upvote.save
      redirect_to :back
    else
      flash[:alert] = "Could not be created due to errors."
      render template: 'comments/new.html.erb', locals: {
        comment: comment,
      }
    end
  end

  def edit
    render locals: {
      comment: Comment.find(params.fetch(:id))
    }
  end

  def update
    comment = Comment.find(params.fetch(:id))
    if comment.update(comment_params)
      redirect_to root_path
    else
      flash[:alert] = "Could not be edited due to errors."
      render template: 'comments/edit.html.erb', locals: {
        comment: comment
      }
    end
  end

  def destroy
    comment = Comment.find(params.fetch(:id))
    comment.destroy
    redirect_to root_path, :notice => "Your comment has been deleted"
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :link_id)
  end

  def disable_nav
    @disable_nav = true
  end
end
