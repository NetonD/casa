defmodule Casa.Rule do
  use Ecto.Schema
  import Ecto.Changeset
  alias Casa.{Condition, RuleGroup}

  schema "rules" do
    field :nome, :string
    field :expression, :string
    belongs_to(:rule_group, RuleGroup, on_replace: :delete)
    has_many(:conditions, Condition, on_delete: :delete_all)
  end

  def changeset(rule, attrs) do
    rule
    |> cast(attrs, [:nome, :expression])
    |> cast_assoc(:conditions)
  end
end
