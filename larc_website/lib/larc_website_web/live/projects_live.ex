defmodule LarcWebsiteWeb.ProjectsLive do
    use Phoenix.LiveView
    alias LarcWebsiteWeb.ProjectsView

    def mount(_session, socket) do
        {:ok, socket}
    end

    def render(assigns) do
        ProjectsView.render("projects.html", assigns)
    end
end
