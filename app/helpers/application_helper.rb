module ApplicationHelper
  def board_link(board)
    link_to "/r/#{board.name}", "/r/#{board.name}"
  end
end
