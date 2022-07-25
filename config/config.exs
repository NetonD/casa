# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :casa,
  ecto_repos: [Casa.Repo]

# Configures the endpoint
config :casa, CasaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "T6qr0Y9izIafj0W1YvRLtpJIuD07PvKOdz3yP7H7qv4cNG4LEU1zGR726JYYPMo3",
  render_errors: [view: CasaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Casa.PubSub,
  live_view: [signing_salt: "o/iO++h6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
