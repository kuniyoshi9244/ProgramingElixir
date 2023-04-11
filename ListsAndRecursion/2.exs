defmodule MyList do

  def max(list) do
    _max(list, 0)
  end

  defp _max([], value) do
    value
  end

  defp _max([head | tail], value) when value > head do
    _max(tail, value)
  end

  defp _max([head | tail], value) when value <= head do
    _max(tail, head)
  end
end
