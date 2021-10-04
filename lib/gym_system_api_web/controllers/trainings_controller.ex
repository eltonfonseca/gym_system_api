defmodule GymSystemApiWeb.TrainingsController do
  use GymSystemApiWeb, :controller

  alias GymSystemApi.Gym
  alias GymSystemApi.Gym.Training

  action_fallback GymSystemApiWeb.FallbackController

  def show(conn, %{"id" => id}) do
    case Gym.get_training(id) do
      {:ok, training} ->
        render(conn, "show.json", training: training)

      {:error, message} ->
        conn
        |> put_status(404)
        |> render("404.json", message: message)
    end
  end

  def index(conn, _params) do
    trainings = Gym.list_trainings()
    render(conn, "index.json", trainings: trainings)
  end
  def create(conn, %{"training" => training_params}) do
    with {:ok, %Training{} = training} <- Gym.create_training(training_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.trainings_path(conn, :show, training))
      |> render("show.json", training: training)
    end
  end
end
