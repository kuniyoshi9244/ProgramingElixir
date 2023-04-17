defmodule Stack.Server do
  use GenServer
  def init(stack) do
    {:ok, stack}
  end
  
  def handle_cast({:push, elem}, current_stack) do
    {:noreply, [elem | current_stack]}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_call(:pop, _from, []) do
    {:reply, [], []}
  end
end
