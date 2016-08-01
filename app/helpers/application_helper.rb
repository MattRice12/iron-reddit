module ApplicationHelper
  def board_link(board)
    link_to "/r/#{board.name}", "/r/#{board.name}"
  end

  def user_link(user)
    link_to "/u/#{user.username}", users_path
  end
end
