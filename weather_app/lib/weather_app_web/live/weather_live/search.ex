defmodule WeatherAppWeb.WeatherLive.Search do
  use WeatherAppWeb, :live_view
  alias WeatherApp.Weather

  def mount(_params, _session, socket) do
    {:ok, assign(socket, weather: nil, city: "")}
  end

  def handle_event("search", %{"city" => city}, socket) do
    case Weather.get_weather(city) do
      {:ok, weather} ->
        {:noreply, assign(socket, weather: weather, city: city)}
      {:error, reason} ->
        {:noreply, assign(socket, weather: nil, city: city, error: reason)}
    end
  end
end
