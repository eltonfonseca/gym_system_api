defmodule GymSystemApi.GymFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GymSystemApi.Gym` context.
  """

  @doc """
  Generate a bodybuilders.
  """
  def bodybuilders_fixture(attrs \\ %{}) do
    {:ok, bodybuilders} =
      attrs
      |> Enum.into(%{
        cpf: "some cpf",
        name: "some name"
      })
      |> GymSystemApi.Gym.create_bodybuilders()

    bodybuilders
  end
end
