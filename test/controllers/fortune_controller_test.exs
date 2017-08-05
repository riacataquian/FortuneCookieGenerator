defmodule FortuneGenerator.FortuneControllerTest do
  use FortuneGenerator.ConnCase
  import Phoenix.HTML, only: [html_escape: 1]

  alias FortuneGenerator.{
    Repo,
    FortuneCookie
  }

  @fortune "A man is known by the company he keeps."

  setup do
    # Insert a single FortuneCookie record
    fortune_cookie = Repo.insert!(%FortuneCookie{fortune: @fortune})

    {:ok, %{fortune_cookie: fortune_cookie}}
  end

  test "renders view for index/2", %{conn: conn} do
    conn = get conn, fortune_path(conn, :index)
    assert html_response(conn, 200) =~ "Fortune Cookie"
  end

  test "show/2 displays a single fortune", %{conn: conn, fortune_cookie: fortune_cookie} do
    conn = get conn, fortune_path(conn, :show, fortune_cookie)
    assert html_response(conn, 200) =~ @fortune
  end

  describe "edit/2" do
    test "displays a randomly selected fortune", %{conn: conn} do
      conn = get conn, fortune_path(conn, :edit)

      assert conn.assigns.fortune_cookie
      assert html_response(conn, 200) =~ @fortune
    end

    test "renders form to update the fortune", %{conn: conn} do
      conn = get conn, fortune_path(conn, :edit)

      assert html_response(conn, 200) =~ "Change your fortune"
    end

    test "renders link to retain fortune", %{conn: conn} do
      conn = get conn, fortune_path(conn, :edit)

      assert html_response(conn, 200) =~ "I'll live with it"
    end
  end

  describe "update/2" do
    test "redirects to show/2 with valid data", %{conn: conn, fortune_cookie: fortune_cookie} do
      conn = put conn, fortune_path(conn, :update, fortune_cookie), fortune_cookie: %{"fortune" => "Anger and hate hinder good counsel."}

      assert redirected_to(conn) == fortune_path(conn, :show, fortune_cookie)
    end

    test "show success flash with valid data", %{conn: conn, fortune_cookie: fortune_cookie} do
      conn = put conn, fortune_path(conn, :update, fortune_cookie), fortune_cookie: %{"fortune" => "Out of sight, out of mind."}

      assert get_flash(conn, :info) =~ "You have updated your fortune."
    end

    test "updates the FortuneCookie struct accordingly", %{conn: conn, fortune_cookie: fortune_cookie} do
      new_fortune_text = "new fortune text"

      refute new_fortune_text == fortune_cookie.fortune

      put conn, fortune_path(conn, :update, fortune_cookie), fortune_cookie: %{"fortune" => new_fortune_text}

      refute Repo.get_by(FortuneCookie, fortune: fortune_cookie.fortune)

      updated_fortune_cookie = Repo.get_by(FortuneCookie, fortune: new_fortune_text)

      assert updated_fortune_cookie
      assert updated_fortune_cookie.id == fortune_cookie.id
    end

    test "renders edit/2 with invalid data", %{conn: conn, fortune_cookie: fortune_cookie} do
      conn = put conn, fortune_path(conn, :update, fortune_cookie), fortune_cookie: %{"fortune" => ""}

      {:safe, error_text} = html_escape("can't be blank")

      assert html_response(conn, 200) =~ error_text
    end

    test "show error flash with invalid data", %{conn: conn, fortune_cookie: fortune_cookie} do
      conn = put conn, fortune_path(conn, :update, fortune_cookie), fortune_cookie: %{"fortune" => ""}

      assert get_flash(conn, :error) =~ "You have entered invalid values. Please check the errors below."
    end
  end
end
