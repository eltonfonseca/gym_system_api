defmodule GymSystemApi.Gym do
  @moduledoc """
  The Gym context.
  """

  import Ecto.Query, warn: false
  alias GymSystemApi.Repo

  alias GymSystemApi.Gym.Bodybuilders

  @doc """
  Returns the list of body_builders.

  ## Examples

      iex> list_body_builders()
      [%Bodybuilders{}, ...]

  """
  def list_body_builders do
    Repo.all(Bodybuilders)
  end

  @doc """
  Gets a single bodybuilders.

  Returns {:error, message} if the Bodybuilders does not exist.

  ## Examples

      iex> get_bodybuilders(123)
      {:ok, %Bodybuilders{}}

      iex> get_bodybuilders(456)
      {:error, message}

  """
  def get_bodybuilders(id) do
    bodybuilder = Repo.get(Bodybuilders, id)

    case bodybuilder do
      nil -> {:error, "No record found"}
      _ -> {:ok, bodybuilder}
    end
  end

  @doc """
  Creates a bodybuilders.

  ## Examples

      iex> create_bodybuilders(%{field: value})
      {:ok, %Bodybuilders{}}

      iex> create_bodybuilders(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bodybuilders(attrs \\ %{}) do
    %Bodybuilders{}
    |> Bodybuilders.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bodybuilders.

  ## Examples

      iex> update_bodybuilders(bodybuilders, %{field: new_value})
      {:ok, %Bodybuilders{}}

      iex> update_bodybuilders(bodybuilders, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bodybuilders(%Bodybuilders{} = bodybuilders, attrs) do
    bodybuilders
    |> Bodybuilders.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bodybuilders.

  ## Examples

      iex> delete_bodybuilders(bodybuilders)
      {:ok, %Bodybuilders{}}

      iex> delete_bodybuilders(bodybuilders)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bodybuilders(%Bodybuilders{} = bodybuilders) do
    Repo.delete(bodybuilders)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bodybuilders changes.

  ## Examples

      iex> change_bodybuilders(bodybuilders)
      %Ecto.Changeset{data: %Bodybuilders{}}

  """
  def change_bodybuilders(%Bodybuilders{} = bodybuilders, attrs \\ %{}) do
    Bodybuilders.changeset(bodybuilders, attrs)
  end
end
