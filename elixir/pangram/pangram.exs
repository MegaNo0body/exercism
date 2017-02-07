defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """


  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    alphabet = ?A..?Z 
               |> MapSet.new

    used_letters = sentence
               |> String.upcase
               |> String.to_charlist
               |> Enum.filter(fn(ch) -> ch in ?A..?Z end)
               |> MapSet.new

    MapSet.equal?(alphabet, used_letters)
  end
end
