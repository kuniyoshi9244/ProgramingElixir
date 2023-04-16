defmodule MySpawn do
  
  import :timer, only: [ sleep: 1 ]
  
  def run do 
    current = self()
    spawn_link(fn -> send(current, "msg") end)
    
    sleep 500
    
    receive do
      msg -> IO.puts msg
    end
  end
  
  def run_raise do 
    spawn_link(fn -> raise "child process error" end)
    
    sleep 500
    
    receive do
      msg -> IO.puts msg
    end
  end
end
