defmodule FortuneGenerator.FortuneController do
  use FortuneGenerator.Web, :controller

  alias FortuneGenerator.Queries.FortuneCookie
  alias Ecto.Changeset

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => fortune_id}) do
    case FortuneCookie.get(fortune_id) do
      nil ->
        conn
        |> put_flash(:error, "Invalid request.")
        |> redirect(to: fortune_path(conn, :index))
      fortune_cookie ->
        conn
        |> put_session(:fortune_cookie, nil)
        |> render("show.html", fortune_cookie: fortune_cookie)
    end
  end

  def edit(conn, %{"id" => fortune_id}) do
    case FortuneCookie.get(fortune_id) do
      nil ->
        conn
        |> put_flash(:error, "Invalid request.")
        |> redirect(to: fortune_path(conn, :index))
      fortune_cookie ->
        changeset =
          fortune_cookie
          |> FortuneCookie.build_changeset()
          |> Changeset.change(%{fortune: nil})

        render conn, "edit.html", changeset: changeset, fortune_cookie: fortune_cookie
    end
  end

  def random(conn, _params) do
    case get_session(conn, :fortune_cookie) do
      nil ->
        fortune_cookie = FortuneCookie.random()
        conn
        |> put_session(:fortune_cookie, fortune_cookie)
        |> render("random.html", fortune_cookie: fortune_cookie)
      fortune_cookie ->
        render(conn, "random.html", fortune_cookie: fortune_cookie)
    end
  end

  def update(conn, %{"fortune_cookie" => params, "id" => id}) do
    case FortuneCookie.update(id, params) do
      {:ok, fortune_cookie} ->
        conn
        |> put_session(:fortune_cookie, nil)
        |> put_flash(:info, "You have updated your fortune.")
        |> redirect(to: fortune_path(conn, :show, fortune_cookie))
      {:error, changeset} ->
        fortune_cookie = FortuneCookie.get(id)

        conn
        |> put_flash(:error, "You have entered invalid values. Please check the errors below.")
        |> render("edit.html", changeset: changeset, fortune_cookie: fortune_cookie)
    end
  end
end
