defmodule ToDoistWeb.Router do
  use ToDoistWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ToDoistWeb do
    pipe_through :api
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinth.Plug.GraphiQL,
      schema: ToDistWeb.Schema,
      interface: :simple,
      context: %{pubsub: ToDoistWeb.Endpoint}
  end
end
