defmodule GymSystemApi.Gym.Training do
  use Ecto.Schema
  import Ecto.Changeset

  alias GymSystemApi.Gym.Bodybuilder

  schema "trainings" do
    field :description, :string
    field :exercises, {:array, :string}

    belongs_to(:bodybuilder, Bodybuilder)

    timestamps()
  end

  @doc false
  def changeset(trainings, attrs) do
    trainings
    |> cast(attrs, [:description, :exercises, :bodybuilder_id])
    |> validate_required([:description, :bodybuilder_id])
  end
end
