defmodule MySpawn do
  
  import :timer, only: [ sleep: 1 ]
  
  def run do 
    spawn_link(fn -> raise "child process error" end)
    
    sleep 500
    
    receive do
      msg -> IO.puts msg
    end
  end
end
