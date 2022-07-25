defmodule Casa.Repo do
  use Ecto.Repo,
    otp_app: :casa,
    adapter: Ecto.Adapters.Postgres
end
