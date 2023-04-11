defmodule MyList do
  def caesar([], _) do
    []
  end

  def caesar([head | tail], n) when head + n > ?z do
    [head + n - ?z * div(head + n, ?z) | caesar(tail ,n)]
  end

  def caesar([head | tail], n) when head + n <= ?z do
    [head + n | caesar(tail ,n)]
  end
end
