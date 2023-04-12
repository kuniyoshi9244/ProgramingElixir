defmodule Strings do
  def ascii?([]) do
    :true
  end

  def ascii?([head | tail]) when head >= 32 and head <= 126 do
    ascii?(tail)
  end

  def ascii?(_) do
    :false
  end
end
