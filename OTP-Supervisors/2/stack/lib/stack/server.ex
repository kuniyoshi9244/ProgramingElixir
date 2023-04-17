defmodule Stack.Server do
  use GenServer
  
  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end
  
  def push(elem) do
    GenServer.cast(__MODULE__, {:push, elem})
  end
  
  def pop() do
    GenServer.call(__MODULE__, :pop)
  end
  
  def init(_) do
    {:ok, Stack.Stash.get()}
  end

  def handle_cast({:push, elem}, _current_stack) when elem < 10 do
    exit(elem)
  end

  def handle_cast({:push, elem}, current_stack) do
    {:noreply, [elem | current_stack]}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
  
  def terminate(_reason, current_stack) do
    Stack.Stash.update(current_stack)
  end
end
