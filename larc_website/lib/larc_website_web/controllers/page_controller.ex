defmodule LarcWebsiteWeb.PageController do
  use LarcWebsiteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
