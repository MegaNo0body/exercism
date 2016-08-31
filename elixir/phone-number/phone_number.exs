defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw
    |> extract
    |> validate_length
  end

  # Extract numbers only, removes "(). +-" characters
  defp extract(raw) do
    Regex.replace(~r/[(). +-]/, raw, "")
  end

  # Return number when len=10
  # Return number when len=11 with first character="1"
  # Return "0000000000" otherwise
  defp validate_length(<<phone::bytes-size(10)>>), do: phone
  defp validate_length(<<"1", phone::bytes-size(10)>>), do: phone
  defp validate_length(_len_non_10), do: "0000000000"

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw
    |> number
    |> String.slice(0,3)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    raw
    |> number
    |> pretty_format  
  end

  # Receives a string containing 10 characteres (hopefuly digits) and format them in format "(area) prefix-sufix"
  defp pretty_format(<<area::bytes-size(3), prefix::bytes-size(3), sufix::bytes-size(4)>>) do
    "(#{area}) #{prefix}-#{sufix}"
  end
end
