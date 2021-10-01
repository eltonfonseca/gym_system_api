defmodule GymSystemApi.Gym.Bodybuilder do
  use Ecto.Schema
  import Ecto.Changeset

  alias GymSystemApi.Gym.Training

  schema "body_builders" do
    field :cpf, :string
    field :name, :string

    has_many(:trainings, Training, on_delete: :delete_all)

    timestamps()
  end

  @doc false
  def changeset(bodybuilder, attrs) do
    bodybuilder
    |> cast(attrs, [:name, :cpf])
    |> validate_required([:name, :cpf])
  end
end
