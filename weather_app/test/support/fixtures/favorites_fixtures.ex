defmodule WeatherApp.FavoritesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WeatherApp.Favorites` context.
  """

  @doc """
  Generate a favorite.
  """
  def favorite_fixture(attrs \\ %{}) do
    {:ok, favorite} =
      attrs
      |> Enum.into(%{
        city: "some city"
      })
      |> WeatherApp.Favorites.create_favorite()

    favorite
  end
end
