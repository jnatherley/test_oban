defmodule TestOban.Repo do
  use Ecto.Repo,
    otp_app: :test_oban,
    adapter: Ecto.Adapters.Postgres
end
