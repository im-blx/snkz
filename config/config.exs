# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :snkz,
  ecto_repos: [Snkz.Repo]

# Configures the endpoint
config :snkz, SnkzWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: SnkzWeb.ErrorHTML, json: SnkzWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Snkz.PubSub,
  live_view: [signing_salt: "LUJFiGub"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :snkz, Snkz.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.3.2",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :gringotts, Gringotts.Gateways.Monei,
    userId: "5b85ae77-8322-46e6-9b2a-8cd76a56b190",
    password: "pk_test_8096193e03751dd8c7413b5fe625763f",
    entityId: "fab52a3cc3dd93ac1ff92ab84ab37a75833c5ff4"

config :ex_cldr, default_backend: Snkz.Cldr

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
