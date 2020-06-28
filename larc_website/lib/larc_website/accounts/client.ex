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
    # IO.inspect(client, label: "Client passed in for changeset: ")
    client
    |> cast(attrs, [:first_name, :last_name, :email_address, :subject, :message])
    |> validate_required([:first_name, :last_name, :email_address, :subject, :message], message: "Cannot be blank.")
    # This regex needs to change.
    |> validate_format(:email_address, ~r/@/, message: "As far as we can tell, that is not a real email.")
    |> validate_length(:first_name, min: 2, message: "Is your first name really less than two letters?")
    |> validate_length(:last_name, min: 2, message: "Is your last name really less than two letters?")
    |> validate_length(:subject, min: 2, message: "Tell us a little more than two letters about your message.")
    |> validate_length(:message, min: 2, message: "That's really all you want to say? Give us more than two letters.")
  end

  def validate_form_input(params) do
    # Validates the parameters of the client
    # Future valdiation could be added here.

    IO.inspect(params)

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
