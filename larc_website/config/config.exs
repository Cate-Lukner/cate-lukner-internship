# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :larc_website,
  ecto_repos: [LarcWebsite.Repo]

# Configures the endpoint
config :larc_website, LarcWebsiteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "A7ZFRnxYZlVzCPIhLkfdsiFfunS3q7o/zLS3mNlniFLV0AuRiZgeqX3jKgxEqC3s",
  render_errors: [view: LarcWebsiteWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LarcWebsite.PubSub,
  live_view: [signing_salt: "vL8rGTlk"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
