defmodule LarcWebsiteWeb.ContactLive do
    use Phoenix.LiveView 
    alias LarcWebsiteWeb.ContactView

    def mount(_session, socket) do
        {:ok, socket}
    end

    def render(assigns) do
        ContactView.render("contact.html", assigns)
    end
end