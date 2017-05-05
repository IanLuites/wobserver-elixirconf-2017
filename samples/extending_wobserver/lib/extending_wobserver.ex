defmodule ExtendingWobserver do
  # Metrics
  def generator do
    [
      flight: {
        &flight_data/0,
        :gauge,
        "Flight data"
      },
    ]
  end

  defp flight_data do
    [
      altitude: 4,
      ground_speed: -5
    ]
  end

  def marbles do
    [
      {5, [color: "blue", shape: "sphere"]},
      {8, [color: "red", shape: "cube"]},
      {1, [color: "green", shape: "pear"]},
    ]
  end

  # Pages
  def stable do
    %{
      test: [
        %{
          name: "Bob",
          speed: 8,
          color: "Kobold Brown",
          image: ~s(<img src="http://ffxivchocobo.com/img/colours/kobold-brown.png" style="width: 10px;" />),
        },
        %{
          name: "Frank",
          speed: 6,
          color: "Cactuar Green",
          image: ~s(<img src="http://ffxivchocobo.com/img/colours/cactuar-green.png" style="width: 10px;" />),
        }
      ],
      frank: %{
        birthday: "1999-01-01",
        country: "Finland",
        occupation: "Secret Agent"
      }
    }
  end

# Dynamic registration
def register do
  if Code.ensure_loaded(Wobserver) == {:module, Wobserver} do
    Wobserver.register :page,
                        {"Stable",
                         :stable,
                         &ExtendingWobserver.stable/0}
    Wobserver.register :metric,
                       [&ExtendingWobserver.generator/0]
  end
end
end
