
defmodule WeatherApp.Favorites do
  alias WeatherApp.Repo
  alias WeatherApp.Favorites.Favorite

  def list_favorites do
    Repo.all(Favorite)
  end

  def get_favorite!(id), do: Repo.get!(Favorite, id)

  def create_favorite(attrs \\ %{}) do
    %Favorite{}
    |> Favorite.changeset(attrs)
    |> Repo.insert()
  end

  def update_favorite(%Favorite{} = favorite, attrs) do
    favorite
    |> Favorite.changeset(attrs)
    |> Repo.update()
  end

  def delete_favorite(%Favorite{} = favorite) do
    Repo.delete(favorite)
  end

  def change_favorite(%Favorite{} = favorite) do
    Favorite.changeset(favorite, %{})
  end
end
