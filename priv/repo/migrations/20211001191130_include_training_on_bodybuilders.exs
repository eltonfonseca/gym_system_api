defmodule GymSystemApi.Repo.Migrations.IncludeTrainingOnBodybuilders do
  use Ecto.Migration

  def change do
    alter table(:trainings) do
      add :bodybuilder_id, references(:body_builders)
    end
  end
end
