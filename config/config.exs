# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_pheonix_chat,
  ecto_repos: [ElixirPheonixChat.Repo]

# Configures the endpoint
config :elixir_pheonix_chat, ElixirPheonixChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2umuUXTsTF9S/RYw4zFsSl+117Np26W3eOHY9dnTFcSSa76WC4Kar19XPFYr1/HR",
  render_errors: [view: ElixirPheonixChatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirPheonixChat.PubSub,
  live_view: [signing_salt: "hGAutW7y"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
