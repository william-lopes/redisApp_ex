defmodule RedisEx.Repo do
  use Ecto.Repo,
    otp_app: :redis_ex,
    adapter: Ecto.Adapters.Postgres
end
