defmodule CsvSigil do
  def sigil_v(lines, 'h') do
    header = get_header(lines)

    [_head | tail] =
      _sigil_v(lines)
      |>  Enum.map(fn line -> Enum.zip(header, line) end)
      
      tail
    end
      
    def sigil_v(lines, _opts) do
      _sigil_v(lines)
    end
    
    defp _sigil_v(lines) do
      lines
      |> String.trim_trailing()
      |> String.trim_leading()
      |> String.split(~r{(\r\n|\r|\n)})
      |> Enum.map(fn line -> 
        String.split(line, ",")
        |> Enum.map(fn word -> parse(word) end)
      end)
    end
    
    defp parse(word) do
      result = Float.parse(word)
      case result do
        :error -> word
        {float_num, str} -> Float.to_string(float_num) <> str
      end
    end
  
    defp get_header(lines) do
      _sigil_v(lines)
      |> List.first()
      |> Enum.map(fn column -> String.to_atom(column) end)
    end
end

defmodule Example do
  
  import CsvSigil

  def create_csv do
    ~v"""
    Item,Qty,Price
    Teddy bear,4,34.95
    Milk,1,2.99
    Battery,6,8.00
    """h
  end
end

IO.inspect Example.create_csv()
