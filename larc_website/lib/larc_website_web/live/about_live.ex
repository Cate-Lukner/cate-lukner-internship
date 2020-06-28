defmodule LarcWebsiteWeb.AboutLive do
    use Phoenix.LiveView 
    alias LarcWebsiteWeb.AboutView

    def mount(_session, socket) do
        {:ok, socket}
    end

    def render(assigns) do
        AboutView.render("about.html", assigns)
    end
end