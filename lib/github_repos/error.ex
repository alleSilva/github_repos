defmodule GithubRepos.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      result: result,
      status: status
    }
  end
end
