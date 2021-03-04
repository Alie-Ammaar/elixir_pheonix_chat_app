defmodule ElixirPheonixChat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  alias ElixirPheonixChat.Repo
  alias ElixirPheonixChat.Message

  schema "messages" do
    field :message, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:name, :message])
    |> validate_required([:name, :message])
  end

  def get_messages(limit \\ 20) do
    Repo.all(Message, limit: limit)
  end
end
