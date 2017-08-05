defmodule FortuneGenerator.Router do
  use FortuneGenerator.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FortuneGenerator do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/fortune", PageController, :show
    put "/fortune/:id", PageController, :update
  end

  # Other scopes may use custom stacks.
  # scope "/api", FortuneGenerator do
  #   pipe_through :api
  # end
end
