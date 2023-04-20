defmodule CsvSigil do
  def sigil_v(lines, _opts) do
    lines
    |> String.trim_trailing()
    |> String.split()
    |> Enum.map(fn line -> 
      String.split(line, ",")
      |> Enum.map(fn word -> parse(word) end)
    end)
  end
  
  def parse(word) do
    result = Float.parse(word)
    IO.inspect(result)
    case result do
      :error -> word
      {float_num, str} -> Float.to_string(float_num) <> str
    end
  end
end

defmodule Example do
  
  import CsvSigil

  def create_csv do
    ~v"""
    1,2,3.14
    cat,dog
    """
  end
end

IO.inspect Example.create_csv()
