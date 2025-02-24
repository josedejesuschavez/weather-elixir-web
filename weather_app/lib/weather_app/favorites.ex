
defmodule WeatherApp.Favorites do
  alias WeatherApp.Repo
  alias WeatherApp.Favorites.Favorite

  def list_favorites do
    Repo.all(Favorite)
  end

  def add_favorite(city) do
    %Favorite{}
    |> Favorite.changeset(%{city: city})
    |> Repo.insert()
  end

  def remove_favorite(id) do
    favorite = Repo.get!(Favorite, id)
    Repo.delete(favorite)
  end

  def delete_favorite(%Favorite{} = favorite) do
    Repo.delete(favorite)
  end

  def change_favorite(%Favorite{} = favorite) do
    Favorite.changeset(favorite, %{})
  end
end
