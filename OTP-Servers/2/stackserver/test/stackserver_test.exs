defmodule StackserverTest do
  use ExUnit.Case
  doctest Stackserver

  test "greets the world" do
    assert Stackserver.hello() == :world
  end
end
