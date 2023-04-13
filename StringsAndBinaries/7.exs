defmodule MyFile do
  def read() do
    {:ok, file} = File.open("sales.csv", [:utf8])

    headers =
      IO.read(file, :line) |>
      split_header_csv

    IO.stream(file, :line) |>
    Enum.map(fn line -> split_data_csv(line) end) |>
    Enum.map(fn line -> Enum.zip(headers, line) end)
  end

  def split_data_csv(line) do
      [id, ship_to, net_amount] = String.split(String.trim(line), ",")
      [String.to_integer(id), String.to_atom(String.trim(ship_to, ":")), String.to_float(net_amount)]
  end

  def split_header_csv(line) do
      String.trim(line) |>
      String.split(",") |>
      Enum.map(&String.to_atom/1)
  end
end
