defmodule FortuneGenerator.FortuneController do
  use FortuneGenerator.Web, :controller

  alias FortuneGenerator.Queries.FortuneCookie

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => fortune_id}) do
    fortune_cookie = FortuneCookie.get(fortune_id)
    render conn, "show.html", fortune_cookie: fortune_cookie
  end

  def edit(conn, _params) do
    fortune_cookie = FortuneCookie.random()
    changeset = FortuneCookie.build_changeset(fortune_cookie)

    render conn, "edit.html", changeset: changeset, fortune_cookie: fortune_cookie
  end

  def update(conn, %{"fortune_cookie" => params, "id" => id}) do
    case FortuneCookie.update(id, params) do
      {:ok, fortune_cookie} ->
        conn
        |> put_flash(:info, "You have updated your fortune.")
        |> redirect(to: fortune_path(conn, :show, fortune_cookie))
      {:error, changeset} -> raise changeset
    end
  end
end