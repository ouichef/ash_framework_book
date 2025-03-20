defmodule Tunez.Repo.Migrations.AddMagicLinkAuth do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    alter table(:users) do
      modify :hashed_password, :text, null: true
    end
  end

  def down do
    alter table(:users) do
      modify :hashed_password, :text, null: false
    end
  end
end
