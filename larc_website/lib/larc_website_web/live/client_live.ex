defmodule LarcWebsiteWeb.ContactFormLive do
    use Phoenix.LiveView

    alias LarcWebsiteWeb.Router.Helpers, as: Routes
    alias LarcWebsiteWeb.ContactView
    alias LarcWebsite.Accounts
    alias LarcWebsite.Accounts.Client

    def mount(_params, _session, socket) do
      IO.inspect(connected?(socket), label: "CONNTECTION STATUS")
      assigns = [
        conn: socket,
        changeset: Accounts.change_client(%Client{}),
        form_data: %{                # This is the form data to be captured and utilized to create a new client
          "first_name" => "",
          "last_name" => "",
          "email_address" => "",
          "subject" => "",
          "message" => "",
        },
      ]

      {:ok, assign(socket, assigns)}
    end

    def render(assigns) do
      ContactView.render("contact-form.html", assigns)
    end

    def handle_event("save", %{"client" => params}, socket) do
      params
      |> Accounts.create_client()
      |> case do
          {:ok, _user} ->
            {:noreply,
            socket
            |> Client.send_contact_email(params)
            |> put_flash(:info, "Your message is sent! Expect a reply soon.")
            |> redirect(to: Routes.page_path(LarcWebsiteWeb.Endpoint, :index))}

          {:error, %Ecto.Changeset{} = changeset} ->
            {:noreply, assign(socket, changeset: changeset)}
      end
    end
end
