defmodule TodoistWeb.Resolvers.Todos do
  alias Todoist.Todos

  def list_user_tasks(_root, %{user: user}, _info) do
    Todos.list_user_tasks(user)
  end
end
