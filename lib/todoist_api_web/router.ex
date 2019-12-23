defmodule TodoistWeb.Router do
  use TodoistWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TodoistWeb do
    pipe_through :api
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: TodoistWeb.Schema,
      interface: :simple,
      context: %{pubsub: TodoistWeb.Endpoint}
  end
end
