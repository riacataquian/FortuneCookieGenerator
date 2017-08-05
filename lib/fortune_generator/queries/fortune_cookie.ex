defmodule FortuneGenerator.Queries.FortuneCookie do
  import Ecto.Query
  alias FortuneGenerator.{
    Repo,
    FortuneCookie
  }

  def random do
    query = from f in FortuneCookie, order_by: fragment("RANDOM()"), limit: 1

    Repo.one(query)
  end
end
