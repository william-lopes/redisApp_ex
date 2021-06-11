defmodule RedisEx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      # RedisEx.Repo,
      # Start the Telemetry supervisor
      RedisExWeb.Telemetry,
      # Start the PubSub system
      # {Phoenix.PubSub, name: RedisEx.PubSub},
      # Start the Endpoint (http/https)
      RedisExWeb.Endpoint,
      # Start a worker by calling: RedisEx.Worker.start_link(arg)
      # {RedisEx.Worker, arg}
      RedisEx.Core.SupervisorSetAgentBucket
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RedisEx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RedisExWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
