defmodule Bob do
  def hey(input) do
    input
    |> String.strip
    |> process
  end

  defp process(input) do
    cond do
      is_empty?(input) -> "Fine. Be that way!"
      is_questioning?(input) -> "Sure."
      is_shouting?(input) and contains_letter?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  def is_empty?(input), do: String.length(input) == 0
  def is_shouting?(input), do: input == String.upcase(input)
  def is_questioning?(input), do: String.ends_with?(input, "?")

  @doc """
    We match the input against the pattern \p{L}, that check if a UNICODE letter is found.
    This is needed for the 'test only numbers' test case.
  """
  def contains_letter?(input), do: String.match?(input, ~r/\p{L}/)
end
