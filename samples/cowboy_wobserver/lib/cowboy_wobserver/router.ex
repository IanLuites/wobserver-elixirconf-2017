defmodule CowboyWobserver.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  forward "/wobserver", to: Wobserver.Web.Router
end
