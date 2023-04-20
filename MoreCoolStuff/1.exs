defmodule CsvSigil do
  def sigil_v(lines, _opts) do
    lines
    |> String.trim_trailing()
    |> String.split(~r{(\r\n|\r|\n)})
    |> Enum.map(fn line -> String.split(line, ",") end)
  end
end

defmodule Example do
  
  import CsvSigil

  def create_csv do
    ~v"""
    1,2,3
    cat,dog
    """
  end
end

IO.inspect Example.create_csv()
