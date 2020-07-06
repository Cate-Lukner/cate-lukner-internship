defmodule LarcWebsite.Email do
  import Bamboo.Email

  use Bamboo.Phoenix,
  view: LarcWebsiteWeb.EmailView

  def contact_email(params) do
    new_email()
    |> from("catluk32@gmail.com") # Replace this with LARC email
    |> to("catluk32@gmail.com") # Replace this with LARC email
    |> subject("New Contact Message: #{Map.get(params, "subject")}")
    |> put_header("Reply-To", Map.get(params, "email_address"))
    |> assign(:first_name, Map.get(params, "first_name"))
    |> assign(:last_name, Map.get(params, "last_name"))
    |> assign(:contact_email_address, Map.get(params, "email_address"))
    |> assign(:message, Map.get(params, "message"))
    |> put_html_layout({LarcWebsiteWeb.LayoutView, "email.html"})
    |> render("contact_message.html")
  end
end
