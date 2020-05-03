defmodule TestOban.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      TestOban.Repo,
      {Oban, Application.get_env(:test_oban, Oban)},
      # Starts a worker by calling: TestOban.Worker.start_link(arg)
      # {TestOban.Worker, arg}
    ]

    :telemetry.attach("oban-logger", [:oban, :trip_circuit], &handle_event/4, nil)
    :telemetry.attach("oban-logger", [:oban, :open_circuit], &handle_event/4, nil)


    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestOban.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def handle_event([:oban, _], _duration, meta, nil) do
    IO.inspect meta
  end

end
