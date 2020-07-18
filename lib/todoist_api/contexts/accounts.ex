defmodule Todoist.Accounts do
  alias Todoist.Accounts.User
  alias Todoist.Repo

  def all_users do
    Repo.all(User)
  end
end
