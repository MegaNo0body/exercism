defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist
    |> Enum.map(fn(char) -> rotate_char(char, shift) end)
    |> to_string
  end

  defp rotate_char(char, shift) when char >= ?a and char <= ?z do
    rem((char - ?a) + shift, ?z - ?a + 1) + ?a
  end
  defp rotate_char(char, shift) when char >= ?A and char <= ?Z do
    rem((char - ?A) + shift, ?Z - ?A + 1) + ?A
  end
  defp rotate_char(char, shift) do
    char
  end
end

