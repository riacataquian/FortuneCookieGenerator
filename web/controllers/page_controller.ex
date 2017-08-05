defmodule FortuneGenerator.PageController do
  use FortuneGenerator.Web, :controller

  alias FortuneGenerator.Queries.FortuneCookie

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, _params) do
    fortune_cookie = FortuneCookie.random()
    changeset = FortuneCookie.build_changeset(fortune_cookie)

    render conn, "show.html", changeset: changeset, fortune_cookie: fortune_cookie
  end

  def update(conn, %{"fortune_cookie" => params, "id" => id}) do
    case FortuneCookie.update(id, params) do
      {:ok, fortune_cookie} ->
        conn
        |> put_flash(:info, "You have updated your fortune.")
        |> redirect(to: page_path(conn, :show, fortune_cookie))
      {:error, changeset} -> raise changeset
    end
  end
end
