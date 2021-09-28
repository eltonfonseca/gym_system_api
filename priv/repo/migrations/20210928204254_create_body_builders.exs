defmodule GymSystemApi.Repo.Migrations.CreateBodyBuilders do
  use Ecto.Migration

  def change do
    create table(:body_builders) do
      add :name, :string
      add :cpf, :string

      timestamps()
    end
  end
end
