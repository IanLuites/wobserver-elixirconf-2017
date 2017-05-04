use Mix.Config

config :wobserver,
  metrics: [
    additional: [
      marbles: {
        &ExtendingWobserver.marbles/0,
        :gauge,
        "Marbles"
      },
    ],
    generators: [
      &ExtendingWobserver.generator/0,
    ]
  ]

config :wobserver,
  pages: [
    {"Stable", :stable, &ExtendingWobserver.stable/0}
  ]
