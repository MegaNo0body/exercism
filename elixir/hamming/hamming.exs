defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    hamming_distance_count strand1, strand2, 0
  end

  def hamming_distance_count([], [], count), do: {:ok, count}
  def hamming_distance_count([_a|_t], [], count), do: {:error, "Lists must be the same length."}
  def hamming_distance_count([], [_b|_t], count), do: {:error, "Lists must be the same length."}
  def hamming_distance_count([nucleotide|tail1], [nucleotide|tail2], count), do: hamming_distance_count(tail1, tail2, count)
  def hamming_distance_count([a|tail1], [b|tail2], count), do: hamming_distance_count(tail1, tail2, count + 1)

end
