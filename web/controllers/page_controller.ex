defmodule FortuneGenerator.PageController do
  use FortuneGenerator.Web, :controller

  alias FortuneGenerator.Queries.FortuneCookie

  def index(conn, _params) do
    render conn, "index.html"
  end

  def new(conn, _params) do
    fortune_cookie = FortuneCookie.random()

    render conn, "new.html", fortune_cookie: fortune_cookie
  end
end
