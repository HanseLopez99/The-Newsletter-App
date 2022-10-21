class HomeController < ApplicationController

  # Get the posts which the user is subscribed to
  def index
    @posts = Post.all
  end

end
