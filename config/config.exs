# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :redis_ex,
  ecto_repos: [RedisEx.Repo]

# Configures the endpoint
config :redis_ex, RedisExWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2xcvohWgakEBLgUp52/zNqtGkrzZ0zNI1MXt3cF0sMsAdMz3F8EjjV9otTIayUZX",
  render_errors: [view: RedisExWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RedisEx.PubSub,
  live_view: [signing_salt: "UmKiPzAM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
