defmodule ExtendingWobserver.Library do
  def extend do
    Wobserver.register :page, {"Library", :library, &page/0}
    Wobserver.register :metric, [&metrics/0]
  end

  defp page do
    %{
      data: %{
        data: "data",
        more: "data"
      }
    }
  end

  defp metrics do
    [
      library: [
        {8, [data: "yes", valid: false]},
        {-8, [data: "no", valid: true]},
      ]
    ]
  end
end