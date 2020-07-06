defmodule LarcWebsite.Accounts.Client do
  use Ecto.Schema
  import Ecto.Changeset

  alias LarcWebsite.{Mailer, Email}

  schema "clients" do
    field :email_address, :string
    field :first_name, :string
    field :last_name, :string
    field :message, :string
    field :subject, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do

    email_regex = ~r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*"

    client
    |> cast(attrs, [:first_name, :last_name, :email_address, :subject, :message])
    |> validate_required([:first_name, :last_name, :email_address, :subject, :message])
    |> validate_format(:email_address, email_regex)
    |> validate_length(:first_name, min: 2)
    |> validate_length(:last_name, min: 2)
    |> validate_length(:subject, min: 2)
    |> validate_length(:message, min: 2)
  end
  def send_contact_email(socket, params) do
    # Specific to the handle event for "save"
    # Send the email and returns the socket that will be
    # passed to put_flash and the redirect

     Email.contact_email(params)
     |> Mailer.deliver_later()

     socket
  end
end
