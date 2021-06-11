defmodule RedisEx.Core.SupervisorSetAgentBucket do
  alias RedisEx.Core.SetAgentBucket, as: Bucket
  use Supervisor

  def start_link(_opt) do
    Supervisor.start_link(__MODULE__, :ok, name: SupervisorSetAgentBucket)
  end

  @impl true
  def init(:ok) do
    children = [
      Bucket
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
