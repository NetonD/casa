defmodule Casa.RuleGroups do
  alias Casa.Repo
  alias Casa.RuleGroup

  def fetch_rule_group(id) when is_binary(id) do
    id = String.to_integer(id)

    Repo.get!(RuleGroup, id)
    |> Repo.preload(rules: [:conditions])
  end

  def fetch_rule_group(id) when is_integer(id) do
    Repo.get!(RuleGroup, id)
    |> Repo.preload(rules: [:conditions])
  end
end
