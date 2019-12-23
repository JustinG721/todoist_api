defmodule Todoist.Repo do
  use Ecto.Repo,
    otp_app: :todoist_api,
    adapter: Ecto.Adapters.Postgres
end
