defmodule FortuneGenerator.PageController do
  use FortuneGenerator.Web, :controller

  alias FortuneGenerator.{
    Repo,
    FortuneCookie
  }

  def index(conn, _params) do
    render conn, "index.html"
  end

  def new(conn, _params) do
    render conn, "new.html"
  end
end
