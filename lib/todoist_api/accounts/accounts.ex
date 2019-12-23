defmodule ToDoist.Accounts do
  alias ToDoist.Accounts.User
  alias ToDoist.Repo

  def all_users do
    Repo.all(User)
  end
end
