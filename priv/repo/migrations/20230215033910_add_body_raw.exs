defmodule Realworld.Repo.Migrations.AddBodyRaw do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    alter table(:articles) do
      add :body_raw, :text, null: false, default: ""
    end
  end

  def down do
    alter table(:articles) do
      remove :body_raw
    end
  end
end