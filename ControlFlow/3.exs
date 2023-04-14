defmodule Util do
  def ok!({:ok, data}) do
    data
  end
  def ok!({_, result}) do
    raise data
  end
end
