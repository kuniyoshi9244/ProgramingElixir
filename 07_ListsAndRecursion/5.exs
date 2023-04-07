defmodule MyEnum do
  def all?([], _func) do
    :true
  end

  def all?([head | tail], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  def each([], _func) do
    :ok
  end

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _func) do
    []
  end

  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def take([], _ammount) do
    []
  end

  def take(_list, 0) do
    []
  end

  def take([head | tail], ammount) when ammount > 0 do
    [head | take(tail, ammount - 1)]
  end

  def take(list, ammount) when ammount < 0 do
    # 最後尾の要素を取り出す
    [head | tail] = Enum.reverse(list)
    # 最後尾に最後尾の要素を追加し、再帰的にtakeを呼び出す
    take(Enum.reverse(tail), ammount + 1) ++ [head]
  end

  def split([], _count) do
    {[], []}
  end

  def split(list, 0) do
    {list, []}
  end

  def split(list, count) when count > 0 do
    if ((length list) - count) > 0 do
      {take(list, count), take(list, count - length list )}
    else
      {list, []}
    end
  end

  def split(list, count) when count < 0 do
    if ((length list) + count) > 0 do
      {take(list, count + length list), take(list, count)}
    else
      {[], list}
    end
  end
end
