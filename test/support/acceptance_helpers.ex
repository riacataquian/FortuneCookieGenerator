defmodule FortuneGenerator.AcceptanceHelpers do
  use Wallaby.DSL

  def click_reveal_fortune(session) do
    session
    |> visit("/")
    |> click_link("Click me to reveal your fortune")
  end

  def click_change_fortune(session) do
    session
    |> visit("/")
    |> click_link("Click me to reveal your fortune")
    |> click_link("Change my fortune")
  end
end