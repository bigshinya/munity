class HomeController < ApplicationController
  def index
    if user_signed_in?
      @posts = current_user.feed
      @post = current_user.posts.build
    end

  end
end
