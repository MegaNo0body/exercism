defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    pling(number)
    |> plang(number)
    |> plong(number)
    |> none(number)
  end

  defp pling(number), do: test(number, 3, "Pling")
  defp plang(text, number), do: text <> test(number, 5, "Plang")
  defp plong(text, number), do: text <> test(number, 7, "Plong")
  defp none("", number), do: Integer.to_string(number)
  defp none(output, _number), do: output

  defp test(number, n, output) when rem(number, n) === 0, do: output
  defp test(_number, _n, _output), do: ""
end
