defmodule WeatherApp.Repo.Migrations.CreateFavorites do
  use Ecto.Migration

  def change do
    create table(:favorites) do
      add :city, :string, null: false
      timestamps()
    end
  end
end
