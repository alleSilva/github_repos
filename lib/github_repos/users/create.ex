defmodule GithubRepos.Users.Create do
  alias GithubRepos.{Error, Repo, User}

  def call(params)do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  def handle_insert({:ok, %User{} = user}), do: {:ok, user}

  def handle_insert({:error, _reslut}), do: {:error, Error.build(:bad_request, "Invalid parameters")}
end
