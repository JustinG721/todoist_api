defmodule ToDoist.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:name, :string, null: false)
    field(:email, :string, null: false)
    field(:password, :string, virtual: true)
    field(:password_hash, :string, null: false)

    timestamps()
  end

  def changeset(model = %__MODULE__{}, attrs) do
    model
    |> cast(attrs, [
      :name,
      :email,
      :password
    ])
    |> validate_required([:name, :email, :password])
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(
         changeset = %Ecto.Changeset{valid?: true, changes: %{password: password}}
       ) do
    change(changeset, Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
