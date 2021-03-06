defmodule TodoMvcWeb.Router do
  use TodoMvcWeb, :router

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

  scope "/", TodoMvcWeb do
    pipe_through :browser

    taper "/", PageController
    # taper "/", PageController, server_only: true
  end

  # Other scopes may use custom stacks.
  # scope "/api", TodoMvcWeb do
  #   pipe_through :api
  # end
end
