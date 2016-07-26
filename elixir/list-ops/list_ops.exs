defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    _count(l, 0)
  end
  
  defp _count([], count), do: count
  defp _count([_head|tail], count), do: _count(tail, count + 1)

  @spec reverse(list) :: list
  def reverse(l) do
    _reverse(l, [])
  end

  defp _reverse([], result), do: result
  defp _reverse([head|tail], result), do: _reverse(tail, [head|result])

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    _map(l, f)
  end

  defp _map([], _f), do: []
  defp _map([head|tail], f), do: _map(tail, f, [f.(head)])
  defp _map([], _f, acc), do: reverse(acc)
  defp _map([head|tail], f, acc), do: _map(tail, f, [f.(head)|acc])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    _filter(l, f)
  end

  defp _filter([], _f), do: []
  defp _filter(l, f), do: _filter(l, f, []) 
  defp _filter([], _f, acc), do: reverse(acc)
  defp _filter([head|tail], f, acc) do
    case f.(head) do
      true -> _filter(tail, f, [head|acc])
      false -> _filter(tail, f, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    _reduce(l, acc, f)
  end
  
  defp _reduce([], acc, _f), do: acc
  defp _reduce([head|tail], acc, f), do: _reduce(tail, f.(head, acc), f)

  @spec append(list, list) :: list
  def append(a, b) do
    a
    |> reverse
    |> _append(b)
  end

  defp _append([], acc), do: acc
  defp _append([head|tail], acc), do: _append(tail, [head|acc])

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    ll
    |> reverse
    |> _concat([])
  end

  defp _concat([], acc), do: acc
  defp _concat([head|tail], acc), do: _concat(tail, append(head, acc))
end
