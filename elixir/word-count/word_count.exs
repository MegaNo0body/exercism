defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> split
    |> count_words
  end

  defp split(sentence), do: String.split(sentence, ~r/[^[:alnum:]-]/u )

  defp count_words(words) do
    Enum.reduce(words, Map.new, &count_word/2)
  end

  defp count_word("", words), do: words
  defp count_word(word, words) do
    lower_word = String.downcase(word)
    Map.update(words, lower_word, 1, fn(value) -> value + 1 end)
  end
end
