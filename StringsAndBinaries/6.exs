defmodule MyString do
  def capitalize_sentences(str) do
    String.split(str) |>
    Enum.reduce("", fn x, acc -> acc <> x <> " " end)
  end
end
