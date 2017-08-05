defmodule FortuneGenerator.Queries.FortuneCookie do
  import Ecto.Query

  alias FortuneGenerator.{
    Repo,
    FortuneCookie
  }

  def get(id) do
    Repo.get(FortuneCookie, id)
  end

  def build_changeset(struct, params \\ %{}) do
    FortuneCookie.changeset(struct, params)
  end

  def update(fortune_id, params) do
    fortune_id
    |> get()
    |> build_changeset(params)
    |> Repo.update()
  end

  def random do
    query = from f in FortuneCookie, order_by: fragment("RANDOM()"), limit: 1

    Repo.one(query)
  end
end
