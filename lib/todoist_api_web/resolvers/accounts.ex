defmodule ToDoistWeb.Resolvers.Account do
  alias ToDoist.Accounts
  alias ToDoistWeb

  def all_users(_root, _args, _info) do
    users = Accounts.all_users()
    {:ok, users}
  end
end
