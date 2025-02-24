
defmodule WeatherApp.Favorites do
  alias WeatherApp.Repo
  alias WeatherApp.Favorites.Favorite

  def list_favorites do
    Repo.all(Favorite)
  end

  def get_favorite!(id), do: Repo.get!(Favorite, id)

  def create_favorite(attrs \\ %{}) do
    city = Map.get(attrs, "city")

    # Verificar si la ciudad ya existe
    case Repo.get_by(Favorite, city: city) do
      nil ->
        # La ciudad no existe, intentar insertar
        changeset = Favorite.changeset(%Favorite{}, attrs)
        if changeset.valid? do
          case Repo.insert(changeset) do
            {:ok, favorite} ->
              IO.puts("Favorite inserted successfully.")
              {:ok, favorite}
            {:error, changeset} ->
              IO.puts("Insert failed.")
              IO.inspect(changeset.errors, label: "Insert failed with errors")
              {:error, changeset}
          end
        else
          IO.puts("Changeset is invalid.")
          IO.inspect(changeset.errors, label: "Changeset errors")
          {:error, changeset}
        end

      _favorite ->
        # La ciudad ya existe
        IO.puts("City already exists in favorites.")
        {:error, "City already exists in favorites."}
    end
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
