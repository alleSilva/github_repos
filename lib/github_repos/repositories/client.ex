defmodule GithubRepos.Repositories.Client do
  use Tesla
  alias GithubRepos.Error
  alias GithubRepos.Repository
  alias Tesla.Env

  plug Tesla.Middleware.BaseUrl, "https://api.github.com/users/"
  plug Tesla.Middleware.JSON

  def get_repos(user_name) do
    "#{user_name}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}) do
    {:ok, Repository.build_repositories(body)}
  end

  defp handle_get({:ok, %Env{status: 404, body: _body}}) do
    {:error, Error.build(:bad_request, "User not found!")}
  end

  defp handle_get({:error, reason}) do
    {:error, Error.build(:bad_request, reason)}
  end
end
