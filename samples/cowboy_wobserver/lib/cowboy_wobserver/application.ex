defmodule CowboyWobserver.Application do
  use Application

  alias Plug.Adapters.Cowboy

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    options = [
      dispatch: [
        {:_, [
          {"/wobserver/ws", Wobserver.Web.Client, []},
          {:_, Cowboy.Handler, {CowboyWobserver.Router, []}}
        ]}
      ],
    ]

    children = [
      Cowboy.child_spec(
        :http,
        CowboyWobserver.Router,
        [],
        options
      )
    ]

    opts = [strategy: :one_for_one, name: CowboyWobserver.Supervisor]
    Supervisor.start_link(children, opts)
  end
end