defmodule PhoenixWobserver.Web.PageController do
  use PhoenixWobserver.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
