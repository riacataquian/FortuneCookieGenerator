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

    get "/", FortuneController, :index
    get "/fortune", FortuneController, :random
    put "/fortune/:id", FortuneController, :update
    get "/change_your_fortune/:id", FortuneController, :edit
    get "/your_fortune/:id", FortuneController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", FortuneGenerator do
  #   pipe_through :api
  # end
end
