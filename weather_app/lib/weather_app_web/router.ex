defmodule WeatherAppWeb.Router do
  use WeatherAppWeb, :router

  pipeline :browser do
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WeatherAppWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  scope "/api", WeatherAppWeb do
    pipe_through :api

    get "/weather/:city", WeatherController, :show
  end
end
