# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :todo_mvc, TodoMvcWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "R/5gZclxmrIs6MpCBOtGwsaE93NwMKiyw+iLvD0gx+sYhqztgNpU0DHgZUll5psL",
  render_errors: [view: TodoMvcWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TodoMvc.PubSub,
  live_view: [signing_salt: "h2zyTah3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, :template_engines, jsx: Taper.Template.Engine

config :taper, :store, TodoMvc.Store

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
