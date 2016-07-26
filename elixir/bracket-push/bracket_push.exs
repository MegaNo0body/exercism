defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.codepoints
    |> check_brackets(:queue.new)
  end

  defp check_brackets([], queue), do: :queue.is_empty queue
  defp check_brackets(["(" | tail], queue), do: push_bracket(tail, queue, "(")
  defp check_brackets(["{" | tail], queue), do: push_bracket(tail, queue, "{")
  defp check_brackets(["[" | tail], queue), do: push_bracket(tail, queue, "[")
  defp check_brackets([")" | tail], queue), do: pop_expected(tail, queue, "(")
  defp check_brackets(["}" | tail], queue), do: pop_expected(tail, queue, "{")
  defp check_brackets(["]" | tail], queue), do: pop_expected(tail, queue, "[")
  defp check_brackets([_ | tail], queue), do: check_brackets(tail, queue)
  defp push_bracket(tail, queue, bracket) do
    new_queue = :queue.in(bracket, queue)
    check_brackets(tail, new_queue)
  end
  defp pop_expected(tail, queue, expected) do
    case :queue.out_r(queue) do
      {{:value, ^expected}, new_queue} ->
        check_brackets(tail, new_queue)
      _ ->
        false
    end
  end
end
