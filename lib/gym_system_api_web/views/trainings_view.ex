defmodule GymSystemApiWeb.TrainingsView do
  use GymSystemApiWeb, :view
  alias GymSystemApiWeb.TrainingsView

  def render("index.json", %{trainings: trainings}) do
    %{data: render_many(trainings, TrainingsView, "training.json", as: :training)}
  end

  def render("show.json", %{training: training}) do
    %{data: render_one(training, TrainingsView, "training.json", as: :training)}
  end

  def render("training.json", %{training: training}) do
    %{
      id: training.id,
      description: training.description,
      exercises: training.exercises
    }
  end

  def render("404.json", %{message: message}) do
    %{error: message}
  end
end
