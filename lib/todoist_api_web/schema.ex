defmodule TodoistWeb.Schema do
  use Absinthe.Schema

  alias __MODULE__, as: Schema

  import_types(Absinthe.Type.Custom)
  import_types(Schema.Accounts)

  query do
    import_fields(:account_queries)
  end
end
