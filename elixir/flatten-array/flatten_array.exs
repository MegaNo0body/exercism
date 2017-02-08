defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    list
    |> flattenn([]) 
    |> reverse([])
  end

  defp flattenn([nil|tail], acc) do
    flattenn(tail, acc)
  end
  defp flattenn([[]|tail], acc) do
    flattenn(tail, acc)
  end
  defp flattenn([head|tail], acc) when is_list(head) do
    flattenn(tail, flattenn(head, acc))
  end
  defp flattenn([head|tail], acc) do
    flattenn(tail, [head | acc])
  end
  defp flattenn([], acc) do
    acc
  end

  defp reverse([head|tail], acc), do: reverse(tail, [head | acc])
  defp reverse([], acc), do: acc
end
