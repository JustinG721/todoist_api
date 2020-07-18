defmodule TodoistWeb.Resolvers.Account do
  alias Todoist.Accounts

  def all_users(_root, _args, _info) do
    users = Accounts.all_users()
    {:ok, users}
  end
end
