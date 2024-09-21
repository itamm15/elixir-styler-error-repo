defmodule StylerError.Repo do
  use Ecto.Repo,
    otp_app: :styler_error,
    adapter: Ecto.Adapters.Postgres
end
