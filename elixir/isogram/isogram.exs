defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    printables = onlyPrintables(sentence)
    unique_letters = printables
                     |> String.to_charlist
                     |> MapSet.new
    MapSet.size(unique_letters) == String.length(printables)
  end

  @doc """
  Removes non-printable characters from sentence
  """
  @spec isogram?(String.t) :: boolean
  def onlyPrintables(sentence) do
    # \p{L} is alphanumeric characters, including unicode
    # we are replacing non ^ alphanumeric classes into ""
    sentence |> String.replace(~r/[^\p{L}]/u, "")
  end

end
