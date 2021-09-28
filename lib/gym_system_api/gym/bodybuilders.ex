defmodule GymSystemApi.Gym.Bodybuilders do
  use Ecto.Schema
  import Ecto.Changeset

  schema "body_builders" do
    field :cpf, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(bodybuilders, attrs) do
    bodybuilders
    |> cast(attrs, [:name, :cpf])
    |> validate_required([:name, :cpf])
  end
end
