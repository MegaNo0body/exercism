defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    to_roman(number)
  end

  # Table to convert number -> romans
  @decimal_table [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}]

  @doc """
    Convert a number to its roman numeral representation

    ## Example:
      iex> RomanNumerals.to_roman(1)
      "I"

      iex> RomanNumerals.to_roman(3)
      "III"

      iex> RomanNumerals.to_roman(4)
      "IV"

      iex> RomanNumerals.to_roman(5)
      "V"

      iex> RomanNumerals.to_roman(6)
      "VI"

      iex> RomanNumerals.to_roman(17)
      "XVII"

      iex> RomanNumerals.to_roman(49)
      "XLIX"
  """
  @spec to_roman(pos_integer()) :: String.t
  def to_roman(number) do
    to_roman(number, @decimal_table, "")
  end


  defp to_roman(0, [], acc), do: acc
  defp to_roman(rest, table = [{base, symbol} | tail], acc) do
    cond do
      rest >= base -> to_roman(rest - base, table, acc <> symbol)
      true -> to_roman(rest, tail, acc)
    end
  end
end
