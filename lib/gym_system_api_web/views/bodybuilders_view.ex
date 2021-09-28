defmodule GymSystemApiWeb.BodybuildersView do
  use GymSystemApiWeb, :view
  alias GymSystemApiWeb.BodybuildersView

  def render("index.json", %{body_builders: body_builders}) do
    %{data: render_many(body_builders, BodybuildersView, "bodybuilders.json")}
  end

  def render("show.json", %{bodybuilders: bodybuilders}) do
    %{data: render_one(bodybuilders, BodybuildersView, "bodybuilders.json")}
  end

  def render("bodybuilders.json", %{bodybuilders: bodybuilders}) do
    %{
      id: bodybuilders.id,
      name: bodybuilders.name,
      cpf: bodybuilders.cpf
    }
  end
end
