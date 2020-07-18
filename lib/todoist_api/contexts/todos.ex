defmodule Todoist.Todos do
  alias Todoist.Todos.Task
  alias Todoist.Repo
  import Ecto.Query, only: [from: 2]

  def list_user_tasks(user) do
    from(t in Task,
      where: t.assigned_to_id == ^user.id
    )
    |> Repo.all()
  end
end
