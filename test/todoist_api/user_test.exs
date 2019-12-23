defmodule ToDoist.UserTest do
  use ToDoist.DataCase, async: true
  alias ToDoist.Repo
  alias ToDoist.User

  describe "changeset" do
    test "creates users provided valid data" do
      user_data = %{name: "dude", email: "test_user", password: "test password"}

      assert {:ok, user} = insert_new_user(user_data)
    end

    test "does not allow two users with the same email to be created" do
      user_data = %{name: "dude", email: "test_user", password: "test password"}
      {:ok, _} = insert_new_user(user_data)

      # insert with the same data as previously
      assert {:error, _} = insert_new_user(user_data)
    end
  end

  defp insert_new_user(user_data) do
    %User{}
    |> User.changeset(user_data)
    |> Repo.insert()
  end
end
