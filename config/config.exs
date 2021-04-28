# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tesla, adapter: Tesla.Adapter.Hackney

config :github_repos,
  ecto_repos: [GithubRepos.Repo]

config :github_repos, GithubRepos.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :github_repos, GithubReposWeb.Auth.Guardian,
  issuer: "github_repos",
  secret_key: "ZM/wJMEdaKGsUCoOiEbZP8/tRt32wDIqBMial2FDEICMO/LjILv7Xzm7cwjHFbHa"

config :github_repos, GithubReposWeb.Auth.Pipeline,
  module: GithubReposWeb.Auth.Guardian,
  error_handler: GithubReposWeb.Auth.ErrorHandler

# Configures the endpoint
config :github_repos, GithubReposWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DkqtpEDXsYuXTXfScnlbn35y8s1GXmNjQ656KK/QT8IO4OwVjJD48GQTz9v312eB",
  render_errors: [view: GithubReposWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GithubRepos.PubSub,
  live_view: [signing_salt: "HsbLSQle"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
