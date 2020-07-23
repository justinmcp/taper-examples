defmodule TodoMvc.Store do
  use Taper.Store.Builder

  alias TodoMvc.Reducers.{Todos, VisibilityFilter}

  reducer Todos,
    name: "todos",
    default: [%{id: 0, text: "Use Taper :)", completed: false}]

  reducer VisibilityFilter,
    name: "visibilityFilter",
    default: "show_all"
end
