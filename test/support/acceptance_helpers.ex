defmodule FortuneGenerator.AcceptanceHelpers do
  use Wallaby.DSL

  @spec click_reveal_fortune(struct) :: struct
  def click_reveal_fortune(session) do
    session
    |> visit("/")
    |> click_link("Reveal my fortune")
  end

  @spec click_change_fortune(struct) :: struct
  def click_change_fortune(session) do
    session
    |> visit("/")
    |> click_link("Reveal my fortune")
    |> click_link("Change my fortune")
  end
end
