defmodule FortuneGenerator.Queries.FortuneCookie do
  import Ecto.Query

  alias FortuneGenerator.{
    Repo,
    FortuneCookie
  }

  @moduledoc """

  Module for FortuneCookie queries.
  Found here are expressions that interacts with FortuneCookie schema.

  """

  @doc """

  Fetches a single record of FortuneCookie in the database.

  ### Example

      iex> FortuneGenerator.Queries.get(1)
      %FortuneGenerator.FortuneCookie{..}

  """
  @spec get(integer) :: struct
  def get(id) do
    Repo.get(FortuneCookie, id)
  end

  @doc """

  Returns a changeset for FortuneCookie schema.

  ### Example

      iex> FortuneGenerator.Queries.build_changeset(%FortuneGenerator.FortuneCookie{})
      %Ecto.Changeset{..}

  """
  @spec build_changeset(struct, map) :: struct
  def build_changeset(struct, params \\ %{}) do
    FortuneCookie.changeset(struct, params)
  end

  @doc """

  Fetches, build changeset and update a single FortuneCookie record.
  Returns the updated record.

  ### Example

      iex> FortuneGenerator.Queries.update(1, %{fortune: "Confess and be hanged."})
      %FortuneGenerator.FortuneCookie{..}

  """
  @spec update(integer, map) :: struct
  def update(fortune_id, params) do
    fortune_id
    |> get()
    |> build_changeset(params)
    |> Repo.update()
  end

  @doc """

  Randomly retrieve a single FortuneCookie in the database.

  ### Example

      iex> FortuneGenerator.Queries.random()
      %FortuneGenerator.FortuneCookie{..}
  """
  @spec random :: struct
  def random do
    query = from f in FortuneCookie, order_by: fragment("RANDOM()"), limit: 1

    Repo.one(query)
  end
end
