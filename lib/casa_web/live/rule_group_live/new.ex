defmodule CasaWeb.RuleGroupLive.New do
  use CasaWeb, :live_view
  import CasaWeb.RuleGroupLive.Helpers
  alias Casa.RuleGroup

  @impl true
  def mount(_params, _session, socket) do
    changeset =
      %RuleGroup{}
      |> RuleGroup.changeset(%{})

    {:ok,
     socket
     |> assign(changeset: changeset)
     |> assign(rule_index_counter: 0)}
  end

  @impl true
  def handle_event("change", params, socket) do
    IO.inspect(params)
    {:noreply, socket}
  end

  def handle_event("add-rule", _params, %{assigns: %{rule_index_counter: index}} = socket) do
    {:noreply,
     socket
     |> assign(rule_index_counter: index + 1)
     |> push_event("add-rule", %{index: index})}
  end
end
