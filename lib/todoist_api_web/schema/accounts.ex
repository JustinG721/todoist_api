defmodule TodoistWeb.Schema.Accounts do
  use Absinthe.Schema.Notation
  alias TodoistWeb.Resolvers

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :email, non_null(:string)
  end

  object(:account_queries) do
    field :all_users, list_of(:user) do
      resolve(&Resolvers.Account.all_users/3)
    end
  end
end
