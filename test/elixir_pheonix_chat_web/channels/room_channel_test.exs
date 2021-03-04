defmodule ElixirPheonixChatWeb.RoomChannelTest do
  use ElixirPheonixChatWeb.ChannelCase

  alias ElixirPheonixChat.Message
  alias ElixirPheonixChat.Repo

  setup do
    {:ok, _, socket} =
      ElixirPheonixChatWeb.UserSocket
      |> socket("user_id", %{some: :assign})
      |> subscribe_and_join(ElixirPheonixChatWeb.RoomChannel, "room:lobby")

    %{socket: socket}
  end

  test "ping replies with status ok", %{socket: socket} do
    ref = push socket, "ping", %{"hello" => "there"}
    assert_reply ref, :ok, %{"hello" => "there"}
  end

  test "shout broadcasts to room:lobby", %{socket: socket} do
    push socket, "shout", %{"hello" => "all"}
    assert_broadcast "shout", %{"hello" => "all"}
  end

  test "broadcasts are pushed to the client", %{socket: socket} do
    broadcast_from! socket, "broadcast", %{"some" => "data"}
    assert_push "broadcast", %{"some" => "data"}
  end

  test ":after_join sends all existing messages", %{socket: socket} do
    # insert a new message to send in the :after_join
    payload = %{name: "Ali Ammaar", message: "Testing chat app"}
    Message.changeset(%Message{}, payload) |> Repo.insert()

    {:ok, _, socket2} = ElixirPheonixChatWeb.UserSocket
      |> socket("user_id", %{some: :assign})
      |> subscribe_and_join(ElixirPheonixChatWeb.RoomChannel, "room:lobby")

    assert socket2.join_ref != socket.join_ref
  end
end
