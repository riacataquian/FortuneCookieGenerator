defmodule FortuneGenerator.GeneratorTest do
  use FortuneGenerator.AcceptanceCase
  import FortuneGenerator.AcceptanceHelpers

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

  describe "clicking 'reveal fortune' link will redirect to edit/2" do
    test "it will display random fortune", %{session: session} do
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
      |> assert_in_body("It's OK. I'll manage.")
    end
  end
end
