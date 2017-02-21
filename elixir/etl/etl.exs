defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(map) :: map
  def transform(input) do
    input
    |> Enum.map(&remap/1)
    |> Enum.reduce(&Map.merge/2)
  end

  defp remap({score, names}) do
    names
    |> Enum.map(&String.downcase/1)
    |> Enum.reduce(Map.new, fn(name, acc) -> Map.put(acc, name, score) end)
  end
end
