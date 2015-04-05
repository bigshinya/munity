module HomeHelper
  def get_issues(repo)
    client = Octokit::Client.new :access_token => "916c7cf2289d349be3f94e774a0778f5a3b8952a" #request.env[:access_token]
    client.list_issues("#{@user.name}/#{repo}")
  end
end
