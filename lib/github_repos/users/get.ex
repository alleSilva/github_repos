defmodule GithubRepos.Users.Get do
  alias Ecto.UUID
  alias GithubRepos.{Error, Repo, User}

  def call(id)do
    case UUID.cast(id) do
      :error -> {:error, Error.build(:bad_request, "Invalid id format")}
      {:ok, uuid} -> get(uuid)
    end
  end

  def get(uuid) do
    case Repo.get(uuid) do
      nil -> {:error, Error.build(:not_found, "User not found")}
      user -> {:ok, user}
    end
  end
end
