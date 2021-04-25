defmodule GithubRepos.Repository do
  @keys [:id, :description, :name, :html_url, :stargazers_count]

  @enforce_keys @keys

  @defstruct @keys

  @derive {Jason.Encoder, only: @keys}

  def build(repository) do
    %__MODULE__{
      id: repository["id"],
      description: repository["description"],
      name: repository["name"],
      html_url: repository["html_url"],
      stargazers_count: repository["stargazers_count"]
    }
  end

  def build_list([_h | _t] = repositories) do
    Enum.map(repositories, & build/1)
  end
end
