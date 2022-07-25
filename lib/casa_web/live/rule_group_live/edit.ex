defmodule CasaWeb.RuleGroupLive.Edit do
  use CasaWeb, :live_view
  import CasaWeb.RuleGroupLive.Helpers
  alias Casa.{RuleGroup, RuleGroups}

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    changeset =
      id
      |> RuleGroups.fetch_rule_group()
      |> RuleGroup.changeset(%{})

    rule_index =
      changeset
      |> Ecto.Changeset.get_field(:rules, [])
      |> Enum.count()

    #conditions_indexes =
    #  changeset
    #  |> Ecto.Changeset.get_field(:rules, [])
    #  |> Enum.map(fn rule -> {rule.index, Enum.count(rule.conditions)} end)

    {:ok,
     socket
     |> assign(changeset: changeset)
     |> assign(rule_index_counter: rule_index)
     |> assign(conditions_indexes: 0)}
  end

  @impl true
  def handle_event("change", params, socket) do
    IO.inspect(params)
    {:noreply, socket}
  end

  def handle_event("add-rule", _params, %{assigns: %{rule_index_counter: index}} = socket) do
    #logica
    {:noreply,
     socket
     |> assign(rule_index_counter: index + 1)
     |> push_event("add-rule", %{index: index})}
  end

  def handle_event(
        "add-condition",
        %{"rule-target" => rule_index, "condition-targer" => condition_index},
        %{assigns: %{rule_index_counter: index}} = socket
      ) do
    {:noreply,
     socket
     |> assign(condition_index: condition_index + 1)
     |> push_event("add-rule", %{index: index, condition_index: condition_index})}
  end
end
