defmodule Stack.Server do
  use GenServer
  
  def start_link(current_stack) do
    GenServer.start_link(__MODULE__, current_stack, name: __MODULE__)
  end
  
  def push(elem) do
    GenServer.cast(__MODULE__, {:push, elem})
  end
  
  def pop() do
    GenServer.call(__MODULE__, :pop)
  end
  
  def init(stack) do
    {:ok, stack}
  end
  
  def handle_cast({:push, elem}, current_stack) do
    {:noreply, [elem | current_stack]}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
end
