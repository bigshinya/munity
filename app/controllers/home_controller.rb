class HomeController < ApplicationController
  def index
    if user_signed_in?
      @posts = current_user.feed
      @post = current_user.posts.build
    end

    @octokit_client = Octokit::Client.new :access_token => request.env[:access_token]
    @issues = @octokit_client.list_issues("bigshinya/munity")
  end
end
