defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) when is_binary(candidates) do
    match(base, String.split(candidates))
  end
  def match(base, candidates) when is_list(candidates) do
    _match(base, candidates, [])
  end

  defp _match(_base, [], results) do
    results
  end
  defp _match(base, [candidate|tail], results) do
    new_results = cond do
        String.upcase(base) == String.upcase(candidate) -> results
        is_anagram(base, candidate) -> results ++ [candidate]
        true -> results
      end
    _match(base, tail, new_results)
  end

  defp is_anagram(a, b) do
    charz(a) == charz(b)
  end

  defp charz(input) do
    input
    |> String.downcase
    |> String.codepoints
    |> Enum.sort
  end
end
