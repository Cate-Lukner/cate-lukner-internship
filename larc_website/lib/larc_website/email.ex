defmodule LarcWebsite.Email do
  import Bamboo.Email

  def contact_email(params) do
    first_name = Map.get(params, "first_name")
    last_name = Map.get(params, "last_name")
    contact_email_address = Map.get(params, "email_address")
    message = Map.get(params, "message")

    new_email()
    |> from("catluk32@gmail.com") # Replace this with LARC email
    |> to("catluk32@gmail.com") # Replace this with LARC email
    |> subject("Contact Submission: #{Map.get(params, "subject")}")
    |> put_header("Reply-To", contact_email_address)
    |> html_body("
    <p>#{first_name} #{last_name} wrote,</p>
    <br>
    <p>#{message}</p>
    <br>
    <p>Reply-To: #{contact_email_address}</p>
    ")
  end
end
