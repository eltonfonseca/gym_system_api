defmodule GymSystemApi.Repo do
  use Ecto.Repo,
    otp_app: :gym_system_api,
    adapter: Ecto.Adapters.Postgres
end
