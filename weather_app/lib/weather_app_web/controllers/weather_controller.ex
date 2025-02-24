defmodule WeatherAppWeb.WeatherController do
  use WeatherAppWeb, :controller
  alias WeatherApp.Weather

  def show(conn, %{"city" => city}) do
    case Weather.get_weather(city) do
      {:ok, weather_data} ->
        json(conn, weather_data)
      {:error, reason} ->
        conn
        |> put_status(:bad_request)
        |> json(%{error: reason})
    end
  end

  def search(conn, _params) do
    render(conn, "search.html")
  end

  def search_results(conn, %{"city" => city}) do
    case Weather.get_weather(city) do
      {:ok, weather} ->
        render(conn, "search_results.html", weather: weather)
      {:error, reason} ->
        conn
        |> put_flash(:error, "Could not fetch weather: #{reason}")
        |> render("search.html")
    end
  end
end
