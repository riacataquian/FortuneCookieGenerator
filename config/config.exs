# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :fortune_generator,
  ecto_repos: [FortuneGenerator.Repo]

# Configures the endpoint
config :fortune_generator, FortuneGenerator.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tjHwc4cicorFvnrVJO9vLHCsPBkM6p7sv3eatKzp+1GkU0RHv3o7Qe683jPVYZje",
  render_errors: [view: FortuneGenerator.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FortuneGenerator.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Pug Config
config :phoenix, :template_engines,
  pug: PhoenixExpug.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
