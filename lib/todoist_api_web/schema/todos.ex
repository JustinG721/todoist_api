defmodule TodoistWeb.Schema.Todos do
  use Absinthe.Schema.Notation
  alias TodoistWeb.Resolvers.Todos

  object :todo do
    field :name, non_null(:string)
    field :assigned_to, non_null(:user)
    field :created_by, non_null(:user)
    field :status, non_null(:string)
    field :description, :string
    field :completed_on, :datetime
  end

  object(:todo_queries) do
    field :user_tasks, list_of(:todo) do
      arg(:user, :user)
      resolve(&Todos.list_user_tasks/3)
    end
  end
end
