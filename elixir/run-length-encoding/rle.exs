defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode("") do
    ""
  end
  def encode(string) do
    string
    |> String.codepoints
    |> Enum.reduce({"", 0, []}, &_count/2)
    |> _encode
  end

  defp _encode([], acc) do
    acc
  end
  defp _encode([{"", count}|t], acc) do
    _encode(t, acc)
  end
  defp _encode([{c, count}|t], acc) do
    _encode(t, acc <> Integer.to_string(count) <> c)
  end
  defp _encode({c, count, res}) do
    all = res ++ [{c, count}]
    _encode(all, "")
  end

  defp _count(c, {c, count, res}) do
    {c, count + 1, res}
  end
  defp _count(c, {o, count, res}) do
    {c, 1, res ++ [{o, count}]}
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(\w)/, string)
    |> _decode("")
  end

  defp _decode([], acc) do
    acc
  end
  defp _decode([[_, count, char]|t], acc) do
    {icount, rest} = Integer.parse(count)
    _decode(t, _append(acc, char, icount))
  end

  defp _append(acc, char, 0) do
    acc
  end
  defp _append(acc, char, count) do
    _append(acc <> char, char, count - 1)
  end
end
