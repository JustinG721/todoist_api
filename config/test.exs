use Mix.Config

# Configure your database
config :todoist_api, Todoist.Repo,
  username: "postgres",
  password: "postgres",
  database: "todoist_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :todoist_api, TodoistWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :bcrypt_elixir, :log_rounds, 4
