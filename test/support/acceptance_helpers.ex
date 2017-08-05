defmodule FortuneGenerator.AcceptanceHelpers do
  use Wallaby.DSL

  def click_reveal_fortune(session) do
    session
    |> visit("/")
    |> click_link("Reveal Fortune")
  end
end
