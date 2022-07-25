defmodule CasaWeb.RuleGroupEditLive do
  use CasaWeb, :live_view
  alias Casa.RuleGroup

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    IO.inspect(id)
    {:ok,
     socket
     |> assign(changeset: nil)
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
