defmodule LarcWebsiteWeb.HomeLive do
    use Phoenix.LiveView 
    alias LarcWebsiteWeb.HomeView

    def mount(_session, socket) do
        {:ok, socket}
    end

    def render(assigns) do
        HomeView.render("home.html", assigns)
    end
end