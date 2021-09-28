defmodule GymSystemApiWeb.BodybuildersController do
  use GymSystemApiWeb, :controller

  alias GymSystemApi.Gym
  alias GymSystemApi.Gym.Bodybuilders

  action_fallback GymSystemApiWeb.FallbackController

  def index(conn, _params) do
    body_builders = Gym.list_body_builders()
    render(conn, "index.json", body_builders: body_builders)
  end

  def create(conn, %{"bodybuilders" => bodybuilders_params}) do
    with {:ok, %Bodybuilders{} = bodybuilders} <- Gym.create_bodybuilders(bodybuilders_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.bodybuilders_path(conn, :show, bodybuilders))
      |> render("show.json", bodybuilders: bodybuilders)
    end
  end

  def show(conn, %{"id" => id}) do
    bodybuilders = Gym.get_bodybuilders!(id)
    render(conn, "show.json", bodybuilders: bodybuilders)
  end

  def update(conn, %{"id" => id, "bodybuilders" => bodybuilders_params}) do
    bodybuilders = Gym.get_bodybuilders!(id)

    with {:ok, %Bodybuilders{} = bodybuilders} <- Gym.update_bodybuilders(bodybuilders, bodybuilders_params) do
      render(conn, "show.json", bodybuilders: bodybuilders)
    end
  end

  def delete(conn, %{"id" => id}) do
    bodybuilders = Gym.get_bodybuilders!(id)

    with {:ok, %Bodybuilders{}} <- Gym.delete_bodybuilders(bodybuilders) do
      send_resp(conn, :no_content, "")
    end
  end
end
