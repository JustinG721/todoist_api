defmodule Todoist.Repo.Migrations.CreateUsersAndTasks do
  use Ecto.Migration

  def up do
    create table(:users) do
      add(:name, :string, null: false)
      add(:email, :string, null: false)
      add(:password_hash, :string, null: false)

      timestamps()
    end

    create table(:tasks) do
      add(:name, :string, null: false)
      add(:description, :text, null: false)
      add(:created_by_id, references(:users), null: false)
      add(:assigned_to_id, references(:users), null: false)
      add(:status, :string)
      add(:completed_on, :utc_datetime)

      timestamps()
    end

    create index(:users, [:email], unique: true)
  end

  def down do
    # drop  tasks first because of the dependency on the user table
    drop(table(:tasks))
    drop(table(:users))
  end
end
