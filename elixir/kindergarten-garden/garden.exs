defmodule Garden do
  @students [
    :alice, :bob, :charlie, :david,
    :eve, :fred, :ginny, :harriet,
    :ileana, :joseph, :kincaid, :larry
  ]

  @plants %{
    ?G => :grass, ?C => :clover,
    ?R => :radishes, ?V => :violets
  }



  @doc """
  Accepts a string representing the arrangement of cups on a windowsill and a
  list with names of students in the class. The student names list does not
  have to be in alphabetical order.

  It decodes that string into the various gardens for each student and returns
  that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(data, students \\ @students) do

    plantation = prepare_plantation(data)

    students
    |> Enum.sort
    |> Enum.with_index
    |> Enum.reduce(Map.new, fn({student, index}, res) ->
      plants = Enum.at(plantation, index, {})
      Map.put(res, student, plants)
    end)
  end

  defp plant_names(plants) do
    plants
    |> Enum.map(fn(plant) -> Map.get(@plants, plant) end)
    |> List.to_tuple
  end

  defp prepare_plantation(data) do
    data
    |> String.split("\n")
    |> Enum.map(&String.to_charlist/1)
    |> Enum.zip
    |> Enum.chunk(2)
    |> Enum.map(fn([{a, c}, {b, d}]) -> [a, b, c, d] end)
    |> Enum.map(&plant_names/1)
  end
end
