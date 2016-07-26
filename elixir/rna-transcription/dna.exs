defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna2rna(dna)
  end

  defp dna2rna(?G), do: 'C'
  defp dna2rna(?C), do: 'G'
  defp dna2rna(?T), do: 'A'
  defp dna2rna(?A), do: 'U'
  defp dna2rna([], acc), do: acc
  defp dna2rna([nucleotide | tail], acc), do: dna2rna(tail, acc ++ dna2rna(nucleotide))
  defp dna2rna(strand) when is_list(strand), do: dna2rna(strand, '')
end
