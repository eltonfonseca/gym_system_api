defmodule GymSystemApi.Repo.Migrations.CreateTrainings do
  use Ecto.Migration

  def change do
    create table(:trainings) do
      add :description, :string
      add :exercises, {:array, :string}

      timestamps()
    end
  end
end
