class BoardsController < ApplicationController
  def index
    render template: 'boards/index.html.erb', locals: {
      boards: Board.all,
      link: Link.where(board_id: params[:board_id]),
      links: Link.group(:id).order("SUM(upvotes_count - downvotes_count) DESC").page(params[:page])
    }
  end

  def show
    if Board.exists?(params[:id])
      render template: 'boards/show.html.erb', locals: {
        board: Board.find(params[:id]),
        comments: Comment.group(:id).order("SUM(comment_upvotes_count - comment_downvotes_count) DESC"),
        links: Link.group(:id).order("SUM(upvotes_count - downvotes_count) DESC").page(params[:page])

      }
    else
      render html: "Not Found", status: 404
    end
  end

  def new
    render locals: {
      board: Board.new
    }
  end

  def create
    board = Board.new(board_params)
    if board.save
      redirect_to root_path
    else
      flash[:alert] = "Could not be created due to errors."
      render template: 'boards/new.html.erb', locals: {
        board: board,
      }
    end
  end

  def edit
    render locals: {
      board: Board.find(params.fetch(:id))
    }
  end

  def update
    board = Board.find(params.fetch(:id))
    if board.update(board_params)
      redirect_to root_path
    else
      flash[:alert] = "Could not be edited due to errors."
      render template: 'boards/edit.html.erb', locals: {
        board: board
      }
    end
  end

  def destroy
    board = Board.find(params.fetch(:id))
    board.destroy
    redirect_to root_path, :notice => "Your board has been deleted"
  end

  private
  def board_params
    params.require(:board).permit(:name)
  end
end
