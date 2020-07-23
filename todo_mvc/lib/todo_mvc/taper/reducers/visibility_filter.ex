defmodule TodoMvc.Reducers.VisibilityFilter do
  def reduce("SET_VISIBILITY_FILTER", %{"filter" => filter}, _state) do
    filter
  end

  def reduce(_, _, state), do: state
end
