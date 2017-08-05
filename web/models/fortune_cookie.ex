defmodule FortuneGenerator.FortuneCookie do
  use FortuneGenerator.Web, :model

  schema "fortune_cookies" do
    field :fortune, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:fortune])
    |> validate_required([:fortune])
  end
end
