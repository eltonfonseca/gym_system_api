defmodule GymSystemApi.GymTest do
  use GymSystemApi.DataCase

  alias GymSystemApi.Gym

  describe "body_builders" do
    alias GymSystemApi.Gym.Bodybuilders

    import GymSystemApi.GymFixtures

    @invalid_attrs %{cpf: nil, name: nil}

    test "list_body_builders/0 returns all body_builders" do
      bodybuilders = bodybuilders_fixture()
      assert Gym.list_body_builders() == [bodybuilders]
    end

    test "get_bodybuilders!/1 returns the bodybuilders with given id" do
      bodybuilders = bodybuilders_fixture()
      assert Gym.get_bodybuilders!(bodybuilders.id) == bodybuilders
    end

    test "create_bodybuilders/1 with valid data creates a bodybuilders" do
      valid_attrs = %{cpf: "some cpf", name: "some name"}

      assert {:ok, %Bodybuilders{} = bodybuilders} = Gym.create_bodybuilders(valid_attrs)
      assert bodybuilders.cpf == "some cpf"
      assert bodybuilders.name == "some name"
    end

    test "create_bodybuilders/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gym.create_bodybuilders(@invalid_attrs)
    end

    test "update_bodybuilders/2 with valid data updates the bodybuilders" do
      bodybuilders = bodybuilders_fixture()
      update_attrs = %{cpf: "some updated cpf", name: "some updated name"}

      assert {:ok, %Bodybuilders{} = bodybuilders} = Gym.update_bodybuilders(bodybuilders, update_attrs)
      assert bodybuilders.cpf == "some updated cpf"
      assert bodybuilders.name == "some updated name"
    end

    test "update_bodybuilders/2 with invalid data returns error changeset" do
      bodybuilders = bodybuilders_fixture()
      assert {:error, %Ecto.Changeset{}} = Gym.update_bodybuilders(bodybuilders, @invalid_attrs)
      assert bodybuilders == Gym.get_bodybuilders!(bodybuilders.id)
    end

    test "delete_bodybuilders/1 deletes the bodybuilders" do
      bodybuilders = bodybuilders_fixture()
      assert {:ok, %Bodybuilders{}} = Gym.delete_bodybuilders(bodybuilders)
      assert_raise Ecto.NoResultsError, fn -> Gym.get_bodybuilders!(bodybuilders.id) end
    end

    test "change_bodybuilders/1 returns a bodybuilders changeset" do
      bodybuilders = bodybuilders_fixture()
      assert %Ecto.Changeset{} = Gym.change_bodybuilders(bodybuilders)
    end
  end
end
