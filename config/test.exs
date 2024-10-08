import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :logger, level: :warning

config :phoenix, :plug_init_mode, :runtime

config :styler_error, StylerError.Mailer, adapter: Swoosh.Adapters.Test

config :styler_error, StylerError.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "styler_error_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :styler_error, StylerErrorWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "cGcR4OPTj/YQgekwvmCV9RCbhFoGH+/k+QezrtQElgtn6au1QTgjZ4pNh+dcgLe/",
  server: false

# In test we don't send emails.

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test

# Initialize plugs at runtime for faster test compilation
