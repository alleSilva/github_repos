defmodule GithubRepos do
  alias GithubRepos.Repositories.Client
  defdelegate get_repos(user_name), to: Client, as: :get_repos
end
