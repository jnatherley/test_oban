defmodule TestOban.Repo.Migrations.AddOban do
  use Ecto.Migration

  def up do
    Oban.Migrations.up(prefix: "t")
  end

  # We specify `version: 1` in `down`, ensuring that we'll roll all the way back down if
  # necessary, regardless of which version we've migrated `up` to.
  def down do
    Oban.Migrations.down(prefix: "t")
  end
end
