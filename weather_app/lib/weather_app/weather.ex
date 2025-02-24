defmodule WeatherApp.Weather do
  @api_url "http://api.weatherapi.com/v1/forecast.json"
  @api_key "fabcfd05db1e440ea5c63007252302"

  def get_weather(city) do
    url = "#{@api_url}?key=#{@api_key}&q=#{city}&days=1"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        {:error, "Invalid city. Please provide a valid city name."}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, "Failed to fetch weather data. Reason: #{reason}"}
    end
  end
end
