defmodule TestTalon.Router do
  use Phoenix.Router
  use Talon.Router


  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/talon", TestTalon.Talon do
    pipe_through :browser
    talon_routes(TestTalon.Talon)
  end

  scope "/front_end", TestTalon.FrontEnd do
    pipe_through :browser
    talon_routes(TestTalon.FrontEnd)
  end
end
