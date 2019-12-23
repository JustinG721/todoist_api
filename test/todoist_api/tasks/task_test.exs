defmodule ToDoist.TaskTest do
  use ExUnit.Case
  use ToDoist.DataCase, async: true
  alias ToDoist.Tasks.Task

  setup do
    users = insert_list(2, :user)
    insert(:task)
    {:ok, users: users}
  end

  describe "changeset" do
    test "creates task provided valid data", %{users: [user1, user2]} do
      task_data = %{
        name: "test task",
        created_by_id: user1.id,
        assigned_to_id: user2.id,
        description: "test description"
      }

      assert {:ok, task} =
               %Task{}
               |> Task.changeset(task_data)
               |> Repo.insert()
    end
  end
end
