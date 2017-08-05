defmodule FortuneGenerator.FortuneControllerTest do
  use FortuneGenerator.ConnCase
  import Phoenix.HTML, only: [html_escape: 1]

  alias FortuneGenerator.{
    Repo,
    FortuneCookie
  }

  @fortune "some random fortune"

  setup do
    fortune_cookie = Repo.insert!(%FortuneCookie{fortune: @fortune})

    {:ok, %{fortune_cookie: fortune_cookie}}
  end

  test "renders view for index/2", %{conn: conn} do
    conn = get conn, fortune_path(conn, :index)
    assert html_response(conn, 200) =~ "Fortune Cookie"
  end

  test "show/2 displays a selected fortune", %{conn: conn, fortune_cookie: fortune_cookie} do
    conn = get conn, fortune_path(conn, :show, fortune_cookie)
    assert html_response(conn, 200) =~ @fortune
  end

  describe "edit/2" do
    test "displays a randomly selected fortune", %{conn: conn} do
      conn = get conn, fortune_path(conn, :edit)
      fortune_cookie = conn.assigns.fortune_cookie

      assert fortune_cookie
      assert html_response(conn, 200) =~ fortune_cookie.fortune
    end

    test "renders form for updating fortune", %{conn: conn} do
      conn = get conn, fortune_path(conn, :edit)

      assert html_response(conn, 200) =~ "Change your fortune"
    end

    test "renders link for updating fortune", %{conn: conn} do
      conn = get conn, fortune_path(conn, :edit)

      assert html_response(conn, 200) =~ "I'll live with it"
    end
  end

  describe "update/2" do
    test "redirects to show/2 for valid data", %{conn: conn, fortune_cookie: fortune_cookie} do
      new_fortune_text = "new fortune text"

      refute new_fortune_text == fortune_cookie.fortune

      conn = put conn, fortune_path(conn, :update, fortune_cookie), fortune_cookie: %{"fortune" => new_fortune_text}
      assert redirected_to(conn) == fortune_path(conn, :show, fortune_cookie)
      assert get_flash(conn, :info) =~ "You have updated your fortune."

      fortune_cookie = Repo.get!(FortuneCookie, fortune_cookie.id)
      assert fortune_cookie.fortune =~ new_fortune_text
    end

    test "renders edit/2 for invalid data", %{conn: conn, fortune_cookie: fortune_cookie} do
      conn = put conn, fortune_path(conn, :update, fortune_cookie), fortune_cookie: %{"fortune" => ""}

      {:safe, error_text} = html_escape("can't be blank")

      assert html_response(conn, 200) =~ error_text
      assert get_flash(conn, :error) =~ "You have entered invalid values. Please check the errors below."
    end
  end
end
