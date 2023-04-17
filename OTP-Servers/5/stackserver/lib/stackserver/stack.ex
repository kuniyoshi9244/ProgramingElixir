defmodule Stack do
  
  @server Stack.Server
  
  def start_link(current_stack) do
    GenServer.start_link(@server, current_stack, name: @server)
  end
  
  def push(elem) do
    GenServer.cast(@server, {:push, elem})
  end
  
  def pop() do
    GenServer.call(@server, :pop)
  end
end
