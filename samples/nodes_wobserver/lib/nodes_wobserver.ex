defmodule NodesWobserver do
  def list do
    [
      node_info(true) |
      Node.list
      |> Enum.map(&check_node/1)
      |> Enum.map(&Task.await/1)
    ]
  end

  def remote_node(caller_pid) do
    send caller_pid, {:wobserver_node, node_info()}
  end

  defp node_info(local \\ false) do
    %Wobserver.Util.Node.Remote{
      name: node() |> to_string,
      host: "localhost",
      port: Application.get_env(:wobserver, :port),
      local?: local,
    }
  end

  defp check_node(remote_node) do
    Task.async fn ->
      Node.spawn remote_node,
                 NodesWobserver,
                 :remote_node,
                 [self()]

      receive do
        {:wobserver_node, data} -> data
      end
    end
  end
end
