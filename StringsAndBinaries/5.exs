defmodule MyString do
  def print_each_elem(str_list) do
    Enum.each(str_list, fn str -> IO.puts pad_string(str, max(str_list)) end)
  end

  def pad_string(str, length) do
    pad_leading_length = String.length(str) + div(length - String.length(str), 2)
    pad_trailing_length = String.length(str) + length

    String.pad_leading(str, pad_leading_length , " ") |>
    String.pad_trailing(pad_trailing_length, " ")
  end

  defp max(str_list) do
    _max(str_list, 0)
  end

  defp _max([], value) do
    value
  end

  defp _max([head | tail], value) do
    if String.length(head) > value do
      _max(tail, String.length(head))
    else
      _max(tail, value)
    end
  end
end
