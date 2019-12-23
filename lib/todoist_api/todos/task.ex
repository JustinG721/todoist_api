defmodule ToDoist.Todos.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @valid_statuses [
    "requested",
    "accepted",
    "rejected",
    "in progress",
    "completed"
  ]

  schema "tasks" do
    field(:name, :string)
    belongs_to(:assigned_to, ToDoist.Accounts.User)
    belongs_to(:created_by, ToDoist.Accounts.User)
    field(:description, :string, null: false)
    field(:status, :string, default: "requested")
    field(:completed_on, :utc_datetime)

    timestamps()
  end

  def changeset(model = %__MODULE__{}, attrs) do
    model
    |> cast(attrs, [:name, :assigned_to_id, :created_by_id, :description])
    |> cast_assoc(:created_by)
    |> cast_assoc(:assigned_to)
    |> validate_required([:name, :description])
    |> validate_inclusion(:status, @valid_statuses)
  end
end
