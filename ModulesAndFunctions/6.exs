defmodule Chop do

  def guess(actual, range) do
    min..max = range
    guess_val = div(min + max, 2)
    IO.puts("Is it #{guess_val}")
    _guess(guess_val, actual, range)
  end

  defp _guess(guess_val, actual, range) when guess_val > actual do
    min..max = range
    guess(actual, min..guess_val-1)
  end

  defp _guess(guess_val, actual, range) when guess_val < actual do
    min..max = range
    guess(actual, min+1..guess_val)
  end

  defp _guess(guess_val, actual, range) when guess_val == actual do
    IO.puts(actual)
  end
end
