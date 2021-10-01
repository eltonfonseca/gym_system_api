defmodule GymSystemApiWeb.BodybuildersView do
  use GymSystemApiWeb, :view

  def render("index.json", %{bodybuilders: body_builders}) do
    %{data: render_many(body_builders, __MODULE__, "bodybuilder.json", as: :bodybuilder)}
  end

  def render("show.json", %{bodybuilder: bodybuilder}) do
    %{data: render_one(bodybuilder, __MODULE__, "bodybuilder.json", as: :bodybuilder)}
  end

  def render("bodybuilder.json", %{bodybuilder: bodybuilder}) do
    %{
      id: bodybuilder.id,
      name: bodybuilder.name,
      cpf: bodybuilder.cpf
    }
  end

  def render("404.json", %{message: message}) do
    %{error: message}
  end
end
