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
end
