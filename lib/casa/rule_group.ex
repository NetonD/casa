defmodule Casa.RuleGroup do
  use Ecto.Schema
  alias Casa.Rule

  import Ecto.Changeset

  schema "rules_groups" do
    field :nome, :string
    field :descricao, :string
    has_many(:rules, Rule, on_replace: :delete)
  end

  def changeset(rule_group, attrs) do
    rule_group
    |> cast(attrs, [:nome, :descricao])
    |> cast_assoc(:rules)
  end

end
