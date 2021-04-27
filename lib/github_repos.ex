defmodule GithubRepos do
  alias GithubRepos.Users.{Create, Get}
  alias GithubRepos.Repositories.Client

  defdelegate get_repos(user_name), to: Client, as: :get_repos

  defdelegate create_user(params), to: Create, as: :call

  defdelegate get_user(id), to: Get, as: :call
end
