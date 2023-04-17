defmodule Stack.Server do
  use GenServer
  def init(stack) do
    {:ok, stack}
  end
  
  def handle_call({:push, elem}, _from, current_stack) do
    {:reply, [elem | current_stack], [elem | current_stack]}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_call(:pop, _from, []) do
    {:reply, [], []}
  end
end
