defmodule GithubReposWeb.UsersView do
  use GithubReposWeb, :view
  alias GithubRepos.User

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  def render("create.json", %{token: token, user: %User{} = user}) do
    %{
      message: "User created",
      token: token,
      user: user
    }
  end

  def render("login.json", %{token: token}) do
    %{token: token}
  end
end
