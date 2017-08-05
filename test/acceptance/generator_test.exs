defmodule FortuneGenerator.GeneratorTest do
  use FortuneGenerator.AcceptanceCase

  alias FortuneGenerator.{
    Repo,
    FortuneCookie
  }

  @fortune "All things come to those that wait."

  setup do
    # Insert a single FortuneCookie record
    fortune_cookie = Repo.insert!(%FortuneCookie{fortune: @fortune})

    {:ok, %{fortune_cookie: fortune_cookie}}
  end

  defp click_reveal_fortune(session) do
    session
    |> visit("/")
    |> click_link("Reveal Fortune")
  end

  describe "clicking 'reveal fortune' link will redirect to edit" do
    test "it display random fortune", %{session: session} do
      session
      |> click_reveal_fortune()
      |> assert_in_body(@fortune)
    end

    test "it will display form to update the fortune", %{session: session} do
      session
      |> click_reveal_fortune()
      |> assert_in_body("Change your fortune")
    end

    test "it will display a link to retain the fortune", %{session: session} do
      session
      |> click_reveal_fortune()
      |> assert_in_body("I'll live with it")
    end
  end
end
