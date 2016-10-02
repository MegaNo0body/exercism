defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    1..limit-1
    |> Enum.filter(fn(value) -> is_factor_of(value, factors) end)
    |> Enum.reduce(0, fn(value, acc) -> acc + value end)
  end

  @spec is_factor_of(non_neg_integer, [non_neg_integer]) :: boolean
  defp is_factor_of(value, factors) do
    Enum.any?(factors, fn(factor) -> rem(value, factor) == 0 end)
  end
end
