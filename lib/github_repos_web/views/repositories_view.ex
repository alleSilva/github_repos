defmodule GithubReposWeb.RepositoriesView do
  use GithubReposWeb, :view
  alias GithubRepos.Repository

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  def render("repositories.json", %{repositories: [%Repository{} | _tail] = repositories}) do
    %{repositories: repositories}
  end
end
