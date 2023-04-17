defmodule Stack.Server do
  use GenServer
  def init(stack) do
    {:ok, stack}
  end
  
  def handle_cast({:push, elem}, _current_stack) when elem < 10 do
    System.halt(elem)
  end

  def handle_cast({:push, elem}, current_stack) do
    {:noreply, [elem | current_stack]}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
  
  def terminate(_reason, current_stack) do
    IO.puts current_stack
  end
end
