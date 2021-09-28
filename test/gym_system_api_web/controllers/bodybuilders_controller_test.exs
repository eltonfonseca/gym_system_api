defmodule GymSystemApiWeb.BodybuildersControllerTest do
  use GymSystemApiWeb.ConnCase

  import GymSystemApi.GymFixtures

  alias GymSystemApi.Gym.Bodybuilders

  @create_attrs %{
    cpf: "some cpf",
    name: "some name"
  }
  @update_attrs %{
    cpf: "some updated cpf",
    name: "some updated name"
  }
  @invalid_attrs %{cpf: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all body_builders", %{conn: conn} do
      conn = get(conn, Routes.bodybuilders_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create bodybuilders" do
    test "renders bodybuilders when data is valid", %{conn: conn} do
      conn = post(conn, Routes.bodybuilders_path(conn, :create), bodybuilders: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.bodybuilders_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "cpf" => "some cpf",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.bodybuilders_path(conn, :create), bodybuilders: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update bodybuilders" do
    setup [:create_bodybuilders]

    test "renders bodybuilders when data is valid", %{conn: conn, bodybuilders: %Bodybuilders{id: id} = bodybuilders} do
      conn = put(conn, Routes.bodybuilders_path(conn, :update, bodybuilders), bodybuilders: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.bodybuilders_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "cpf" => "some updated cpf",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, bodybuilders: bodybuilders} do
      conn = put(conn, Routes.bodybuilders_path(conn, :update, bodybuilders), bodybuilders: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete bodybuilders" do
    setup [:create_bodybuilders]

    test "deletes chosen bodybuilders", %{conn: conn, bodybuilders: bodybuilders} do
      conn = delete(conn, Routes.bodybuilders_path(conn, :delete, bodybuilders))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.bodybuilders_path(conn, :show, bodybuilders))
      end
    end
  end

  defp create_bodybuilders(_) do
    bodybuilders = bodybuilders_fixture()
    %{bodybuilders: bodybuilders}
  end
end
