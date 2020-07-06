defmodule LarcWebsite.Repo do
  use Ecto.Repo,
    otp_app: :larc_website,
    adapter: Ecto.Adapters.MyXQL
end
