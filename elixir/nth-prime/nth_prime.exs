defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count > 0 do
    nth_prime(count, 2, :null)
  end

  @spec nth_prime(pos_integer, non_neg_integer, non_neg_integer) :: pos_integer
  defp nth_prime(0, _current_number, current_prime), do: current_prime
  defp nth_prime(nth, current_number, current_prime) do
    prime = is_prime(current_number)
    new_nth = if(prime, do: nth - 1, else: nth)
    new_prime = if(prime, do: current_number, else: current_prime)
    nth_prime(new_nth, current_number + 1, new_prime)
  end

  @spec is_prime(pos_integer) :: boolean
  defp is_prime(2), do: true
  defp is_prime(number) do
    max = round(:math.sqrt(number))
    2..max
    |> Enum.any?(fn(value) -> rem(number, value) == 0 end)
    |> Kernel.not
  end
end
