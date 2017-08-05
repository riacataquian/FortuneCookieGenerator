defmodule FortuneGenerator.FortuneTest do
  use FortuneGenerator.AcceptanceCase
  import FortuneGenerator.AcceptanceHelpers

  alias FortuneGenerator.{
    Repo,
    FortuneCookie
  }

  @fortune "Give credit where credit is due."

  setup do
    # Insert a single FortuneCookie record
    fortune_cookie = Repo.insert!(%FortuneCookie{fortune: @fortune})

    {:ok, %{fortune_cookie: fortune_cookie}}
  end

  describe "users should be able to change their fortunes" do
    test "it redirects to show when entry is valid", %{session: session} do
      fortune = "Two cannot fall out if one does not choose."

      session
      |> click_reveal_fortune()
      |> fill_in("Fortune", with: fortune)
      |> click_on("Change your fortune")

      assert_in_body session, fortune
    end

    test "it displays an info flash message with valid data", %{session: session} do
      fortune = "Do as you would be done by."

      session
      |> click_reveal_fortune()
      |> fill_in("Fortune", with: fortune)
      |> click_on("Change your fortune")
      |> find(".alert-info")

      assert_in_body session, fortune
    end

    test "it does not redirect with invalid data", %{session: session} do
      session
      |> click_reveal_fortune()
      |> fill_in("Fortune", with: "")
      |> click_on("Change your fortune")
      |> find(".alert-error")

      assert_in_body session, @fortune
    end
  end

  describe "users should be able to retain their fortunes" do
    test "displays the initial retrieved fortune", %{session: session} do
      session
      |> click_reveal_fortune()
      |> click_link("It's OK. I'll manage.")

      assert_in_body session, @fortune
    end
  end
end
