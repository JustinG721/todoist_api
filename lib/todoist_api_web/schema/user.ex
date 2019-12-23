defmodule TodoistWeb.Schema.User do
  use Absinthe.Schema

  object :user do
    field :name, non_null(:string)
    field :email, non_null(:string)
  end

  query do
    field :all_users, list_of(:user) do
      resolve(&UserResolver.all_users/3)
    end
  end
end
