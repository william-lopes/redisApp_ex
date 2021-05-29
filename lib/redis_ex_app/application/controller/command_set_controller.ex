defmodule RedisExApp.CommandSetController do
    use RedisExWeb, :controller
  
    def post(conn, _params) do
        conn
        |> send_resp(200, "ok")
    end
  end