defmodule Casa.Repo.Migrations.Rule do
  use Ecto.Migration

  def change do
    create table(:rules_groups) do
      add :nome, :string
      add :descricao, :string
    end

    create table(:rules) do
      add :nome, :string
      add :expression, :string
      add :rule_group_id, references(:rules_groups)
    end

    create table(:conditions) do
      add :evaluator, :string
      add :value, :string
      add :operator, :string
      add :rule_id, references(:rules)
    end
  end
end
