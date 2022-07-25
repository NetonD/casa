defmodule Casa.Condition do
  use Ecto.Schema
  import Ecto.Changeset
  alias Casa.Rule

  schema "conditions" do
    field :evaluator, :string
    field :operator, :string
    field :value, :string
    belongs_to(:rule, Rule)
  end

  def changeset(conditions, attrs) do
    conditions
    |> cast(attrs, [:evaluator, :operator, :value])
  end
end
