defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    in_earth_years(planet, seconds)
  end

  defp in_earth_years(:earth, seconds), do: seconds / 31557600 
  defp in_earth_years(:mercury, seconds), do: in_earth_years(:earth, seconds) / 0.2408467
  defp in_earth_years(:venus, seconds), do: in_earth_years(:earth, seconds) / 0.61519726
  defp in_earth_years(:mars, seconds), do: in_earth_years(:earth, seconds) / 1.8808158
  defp in_earth_years(:jupiter, seconds), do: in_earth_years(:earth, seconds) / 11.862615
  defp in_earth_years(:saturn, seconds), do: in_earth_years(:earth, seconds) / 29.447498
  defp in_earth_years(:uranus, seconds), do: in_earth_years(:earth, seconds) / 84.016846
  defp in_earth_years(:neptune, seconds), do: in_earth_years(:earth, seconds) / 164.79132
end
