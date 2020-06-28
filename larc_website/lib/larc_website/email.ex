defmodule LarcWebsite.Email do
  import Bamboo.Email

  def contact_email(params) do
    email = Map.get(params, "email_address")
    subject = Map.get(params, "subject")
    message = Map.get(params, "message")
    new_email(
      to: email,
      from: "catluk32@gmail.com",
      subject: subject,
      html_body: "Hey it's Catherine",
      text_body: message
    )
  end
end
