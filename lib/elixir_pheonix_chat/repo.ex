defmodule ElixirPheonixChat.Repo do
  use Ecto.Repo,
    otp_app: :elixir_pheonix_chat,
    adapter: Ecto.Adapters.Postgres
end
