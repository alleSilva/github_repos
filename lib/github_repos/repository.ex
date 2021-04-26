defmodule GithubRepos.Repository do
  @keys [:id, :description, :name, :html_url, :stargazers_count]

  @enforce_keys @keys

  @derive {Jason.Encoder, only: @keys}

  defstruct @keys

  def build_repository(repository) do
    %__MODULE__{
      id: repository["id"],
      description: repository["description"],
      name: repository["name"],
      html_url: repository["html_url"],
      stargazers_count: repository["stargazers_count"]
    }
  end

  def build_repositories([_h | _t] = repositories) do
    Enum.map(repositories, &build_repository/1)
  end
end
