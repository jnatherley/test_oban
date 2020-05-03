import Config

config :test_oban, ecto_repos: [TestOban.Repo]

config :test_oban, TestOban.Repo,
  database: "test_oban_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :test_oban, Oban,
  repo: TestOban.Repo,
  prefix: "t",
  queues: [events: 1000],
  verbose: :debug,
  crontab: [
    {"* * * * *", TestOban.SlowWorker}
  ]
