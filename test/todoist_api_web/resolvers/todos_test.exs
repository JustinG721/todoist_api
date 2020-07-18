defmodule TodoistWeb.Resolvers.TodosTest do
  alias TodoistWeb.Resolvers.Todos
  use ExUnit.Case
  use Todoist.DataCase

  describe "list_user_tasks/3" do
    test "list users tasks..." do
      user = insert(:user)
      tasks = insert_list(2, :task, assigned_to: user)
      # insert another task not related to the user
      insert(:task)

      queried_tasks = Todos.list_user_tasks(nil, %{user: user}, nil)

      assert get_task_ids(queried_tasks) == get_task_ids(tasks)
    end
  end


  defp get_task_ids(tasks) do
    tasks
    |> Enum.map(&(&1.id))
    |> Enum.sort()
  end
end
