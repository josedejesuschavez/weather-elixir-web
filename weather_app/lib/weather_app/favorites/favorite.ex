defmodule WeatherApp.Favorites.Favorite do
  use Ecto.Schema
  import Ecto.Changeset

  schema "favorites" do
    field :city, :string
    timestamps()
  end

  def changeset(favorite, attrs) do
    favorite
    |> cast(attrs, [:city])
    |> validate_required([:city])
  end
end
