defmodule TestOban.SlowWorker do
  use Oban.Worker,
  queue: :events,
  max_attempts: 10,
  priority: 1,
  tags: ["business"],
  unique: [period: 30]

  @impl Oban.Worker
  def perform(
        _foo,
        _job
      ) do
    :ok
  end

end
