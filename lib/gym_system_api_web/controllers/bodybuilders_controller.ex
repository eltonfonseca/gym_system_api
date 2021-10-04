defmodule GymSystemApiWeb.BodybuildersController do
  use GymSystemApiWeb, :controller

  alias GymSystemApi.Gym
  alias GymSystemApi.Gym.Bodybuilder

  action_fallback GymSystemApiWeb.FallbackController

  def index(conn, _params) do
    body_builders = Gym.list_body_builders()
    render(conn, "index.json", bodybuilders: body_builders)
  end

  def create(conn, %{"bodybuilder" => bodybuilder_params}) do
    with {:ok, %Bodybuilder{} = bodybuilder} <- Gym.create_bodybuilder(bodybuilder_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.bodybuilders_path(conn, :show, bodybuilder))
      |> render("show.json", bodybuilder: bodybuilder)
    end
  end

  def show(conn, %{"id" => id}) do
    case Gym.get_bodybuilder(id) do
      {:ok, bodybuilder} ->
        render(conn, "show.json", bodybuilder: bodybuilder)

      {:error, message} ->
        conn
        |> put_status(404)
        |> render("404.json", message: message)
    end
  end

  def update(conn, %{"id" => id, "bodybuilder" => bodybuilder_params}) do
    case Gym.get_bodybuilder(id) do
      {:ok, bodybuilder} ->
        Gym.update_bodybuilder(bodybuilder, bodybuilder_params)
        render(conn, "show.json", bodybuilder: bodybuilder)

      {:error, message} ->
        conn
        |> put_status(404)
        |> render("404.json", message: message)
    end
  end

  def delete(conn, %{"id" => id}) do
    case Gym.get_bodybuilder(id) do
      {:ok, bodybuilder} ->
        Gym.delete_bodybuilder(bodybuilder)
        send_resp(conn, :no_content, "")

      {:error, message} ->
        conn
        |> put_status(404)
        |> render("404.json", message: message)
    end
  end

  def list_trainings(conn, %{"bodybuilders_id" => bodybuilders_id}) do
    trainings = Gym.list_bodybuilder_tranings(bodybuilders_id)
    render(conn, "tranings_by_bodybuilder.json", trainings: trainings)
  end
end
