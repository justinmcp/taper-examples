defmodule TodoMvc.Reducers.Todos do
  def reduce("ADD_TODO", %{"text" => text}, state) when state == [] do
    [%{id: 0, completed: false, text: text}]
  end

  def reduce("ADD_TODO", %{"text" => text}, state) do
    max_id =
      state
      |> Enum.map(& &1.id)
      |> Enum.max()

    state ++
      [
        %{
          id: max_id + 1,
          completed: false,
          text: text
        }
      ]
  end

  def reduce("DELETE_TODO", %{"id" => id}, state) do
    Enum.reject(state, &(&1.id == id))
  end

  def reduce("EDIT_TODO", %{"id" => id, "text" => text}, state) do
    state
    |> Enum.map(fn
      %{id: todo_id} = todo when todo_id == id ->
        Map.update!(todo, :text, fn _ -> text end)

      todo ->
        todo
    end)
  end

  def reduce("COMPLETE_TODO", %{"id" => id}, state) do
    state
    |> Enum.map(fn
      %{id: todo_id} = todo when todo_id == id ->
        Map.update!(todo, :completed, &(!&1))

      todo ->
        todo
    end)
  end

  def reduce("COMPLETE_ALL_TODOS", _params, state) do
    all_complete = Enum.all?(state, & &1.completed)

    Enum.map(state, &Map.update!(&1, :completed, fn _ -> !all_complete end))
  end

  def reduce("CLEAR_COMPLETED", _params, state) do
    Enum.filter(state, &(&1.completed == false))
  end

  def reduce(_, _, state), do: state
end
