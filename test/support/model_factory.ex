defmodule TestHelpers.ModelFactory do
  use ExMachina.Ecto, repo: ToDoist.Repo

  def user_factory do
    %ToDoist.User{
      name: "test man",
      email: sequence(:email, &"email-#{&1}@test.com"),
      password_hash: Bcrypt.add_hash("test_password") |> Map.get(:password_hash)
    }
  end

  def task_factory do
    %ToDoist.Task{
      name: "test task",
      assigned_to: build(:user),
      created_by: build(:user),
      description: "test description",
      status: "requested"
    }
  end
end
