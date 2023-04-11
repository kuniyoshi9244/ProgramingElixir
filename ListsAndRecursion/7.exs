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

  def getPrimeNum(n) do
    for x <- MyList.span(2, n), is_prime(x), do: x
  end

  defp is_prime(n) when n == 2, do: :true
  defp is_prime(n) when n < 2, do: :false
  defp is_prime(n) when n > 2 do
    Enum.all?(for x <- MyList.span(2, n - 1), do: rem(n, x) != 0)
  end
end
