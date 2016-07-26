defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a === b, do: :equal
  def compare(a, b) do
    cond do
      is_sublist(a, b) -> :sublist
      is_sublist(b, a) -> :superlist
      true -> :unequal
    end
  end

  def is_sublist(_a, []), do: false
  def is_sublist(a, b=[_b|t]) do
    cond do
      is_sublist_test(a, b) -> true
      true -> is_sublist(a, t)
    end
  end

  def is_sublist_test([], _b), do: true
  def is_sublist_test([x|at], [x|bt]), do: is_sublist_test(at, bt)
  def is_sublist_test(_a, _b), do: false
end
