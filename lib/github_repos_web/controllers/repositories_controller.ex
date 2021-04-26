defmodule GithubReposWeb.RepositoriesController do
  use GithubReposWeb, :controller
  alias GithubRepos.Repository

  def show(conn, %{"user" => user_name}) do
    with {:ok, [%Repository{} | _tail] = repositories} <- GithubRepos.get_repos(user_name) do
      conn
      |> put_status(:ok)
      |> render("repositories.json", repositories: repositories)
    end
  end
end
