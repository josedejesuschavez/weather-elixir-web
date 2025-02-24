defmodule WeatherAppWeb.WeatherLive.Search do
  use WeatherAppWeb, :live_view
  alias WeatherApp.Weather
  alias WeatherApp.Favorites

  def mount(_params, _session, socket) do
    {:ok, assign(socket, weather: nil, city: "", error: nil, form: %{"city" => ""})}
  end

  def handle_event("search", %{"city" => city}, socket) do
    case Weather.get_weather(city) do
      {:ok, weather} ->
        {:noreply, assign(socket, weather: weather, city: city, error: nil)}
      {:error, reason} ->
        {:noreply, assign(socket, weather: nil, city: city, error: reason)}
    end
  end

  def handle_event("add_to_favorites", %{"city" => city}, socket) do
    IO.puts("#{city} add_to_favorites")
    case Favorites.create_favorite(%{"city" => city}) do
      {:ok, _favorite} ->
        {:noreply, socket |> put_flash(:info, "#{city} added to favorites.")}

      {:error, _changeset} ->
        {:noreply, socket |> put_flash(:error, "Failed to add #{city} to favorites.")}
    end
  end
end
