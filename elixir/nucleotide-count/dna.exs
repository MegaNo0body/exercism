defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]
  @empty_histogram %{?A => 0, ?T => 0, ?C => 0, ?G => 0}

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    validate_nucleotide(nucleotide)
    strand
    |> histogram
    |> Map.get(nucleotide)
  end
  
  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    strand
    |> calculate_histogram(@empty_histogram)
  end

  defp calculate_histogram([], hist), do: hist
  defp calculate_histogram([nucleotide | tail], hist) do
    validate_nucleotide(nucleotide)
    updated_histogram = Map.update! hist, nucleotide, &(&1 + 1)
    calculate_histogram(tail, updated_histogram)
  end

  defp validate_nucleotide(nucleotide) do
    unless Enum.member?(@nucleotides, nucleotide), do:
      raise ArgumentError, message: "Invalid nucleotide"
  end
end
