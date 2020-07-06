defmodule LarcWebsiteWeb.TeamLive do
  use Phoenix.LiveView
  alias LarcWebsiteWeb.TeamView

  def mount(_session, socket) do
      {:ok, socket}
  end

  def render(assigns) do
      TeamView.render("team.html", assigns)
  end
end
