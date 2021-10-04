defmodule GymSystemApi.Gym do
  import Ecto.Query, warn: false

  alias GymSystemApi.Repo
  alias GymSystemApi.Gym.Bodybuilder
  alias GymSystemApi.Gym.Training

  def list_body_builders do
    Repo.all(Bodybuilder)
  end

  def list_trainings do
    Repo.all(Training)
  end

  def get_training(id) do
    training =
      Repo.get(Training, id)

    case training do
      nil -> {:error, "No record found"}
      _ -> {:ok, training}
    end
  end

  def get_bodybuilder(id) do
    bodybuilder =
      Repo.get(Bodybuilder, id)

    case bodybuilder do
      nil -> {:error, "No record found"}
      _ -> {:ok, bodybuilder}
    end
  end

  def create_bodybuilder(attrs \\ %{}) do
    %Bodybuilder{}
    |> Bodybuilder.changeset(attrs)
    |> Repo.insert()
  end

  def create_training(attrs \\ %{}) do
    %Training{}
    |> Training.changeset(attrs)
    |> Repo.insert()
  end

  def update_bodybuilder(%Bodybuilder{} = bodybuilder, attrs) do
    bodybuilder
    |> Bodybuilder.changeset(attrs)
    |> Repo.update()
  end

  def delete_bodybuilder(%Bodybuilder{} = bodybuilder) do
    Repo.delete(bodybuilder)
  end

  def change_bodybuilder(%Bodybuilder{} = bodybuilder, attrs \\ %{}) do
    Bodybuilder.changeset(bodybuilder, attrs)
  end

  def list_bodybuilder_tranings(bodybuilder_id) do
    Repo.all(
      from(training in Training,
        where: training.bodybuilder_id == ^bodybuilder_id,
        select: training
      )
    )
  end
end
