defmodule MyList do
  def span(from, to) do
    to_list(from..to)
  end

  def to_list(from..to) when from == to do
    [from]
  end

  def to_list(from..to) do
  [from | to_list((from + 1)..to)]
  end
end
