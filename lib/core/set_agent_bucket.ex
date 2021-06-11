defmodule RedisEx.Core.SetAgentBucket do
  use Agent

  def start_link(_inital_value) do
    Agent.start_link(fn -> %{} end, name: SetAgentBucket)
  end

  def get(key) do
    Agent.get(SetAgentBucket, fn state -> Map.get(state, key) end)
  end

  def set(key, value) do
    Agent.update(SetAgentBucket, fn state -> Map.put(state, key, value) end)
  end
end
