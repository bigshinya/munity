module HomeHelper
  def get_issues(repo)
    if Rails.env.production?
      client = Octokit::Client.new :access_token => ENV["GITHUB_ACCESS_TOKEN"]
    else
      client = Octokit::Client.new :access_token => Rails.application.secrets.dev_github_access_token #request.env[:access_token]
    end

    client.list_issues("#{@user.name}/#{repo}")
  end
end
