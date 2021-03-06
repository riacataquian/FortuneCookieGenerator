use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fortune_generator, FortuneGenerator.Endpoint,
  http: [port: 4001],
  server: true

config :fortune_generator, :sql_sandbox, true

config :wallaby,
  max_wait_time: 5_000,
  js_errors: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
if File.exists?("config/database.exs") do
  import_config "database.exs"
else
  config :fortune_generator, FortuneGenerator.Repo,
    adapter: Ecto.Adapters.Postgres,
    username: "postgres",
    password: "postgres",
    database: "fortune_generator_test",
    hostname: "localhost",
    pool: Ecto.Adapters.SQL.Sandbox
end
