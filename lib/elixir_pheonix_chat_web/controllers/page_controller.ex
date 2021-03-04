defmodule ElixirPheonixChatWeb.PageController do
  use ElixirPheonixChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
