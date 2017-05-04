config :wobserver,
  discovery: :dns,
  discovery_search: "google.nl"

config :wobserver,
  discovery: :custom,
  discovery_search: &MyApp.discover/0

config :wobserver,
  discovery: :custom,
  discovery_search: fn -> [] end
