class HomeController < ApplicationController

  # Get the posts which the user is subscribed to
  def index
    @posts = Post.joins(:newsletter).where(newsletters: { user_id: current_user.id })
  end

end
