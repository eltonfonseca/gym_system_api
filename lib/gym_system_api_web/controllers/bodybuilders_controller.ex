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
    case Gym.get_bodybuilders(id) do
      {:ok, bodybuilder} ->
        render(conn, "show.json", bodybuilders: bodybuilder)

      {:error, message} ->
        conn
        |> put_status(404)
        |> render("404.json", message: message)
    end
  end

  def update(conn, %{"id" => id, "bodybuilders" => bodybuilders_params}) do
    case Gym.get_bodybuilders(id) do
      {:ok, bodybuilder} ->
        Gym.update_bodybuilders(bodybuilder, bodybuilders_params)
        render(conn, "show.json", bodybuilders: bodybuilder)

      {:error, message} ->
        conn
        |> put_status(404)
        |> render("404.json", message: message)
    end
  end

  def delete(conn, %{"id" => id}) do
    case Gym.get_bodybuilders(id) do
      {:ok, bodybuilder} ->
        Gym.delete_bodybuilders(bodybuilder)
        send_resp(conn, :no_content, "")

      {:error, message} ->
        conn
        |> put_status(404)
        |> render("404.json", message: message)
    end
  end
end
