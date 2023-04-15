defmodule MySpawn do
  def receive_func do
    receive do
      {sender, msg} ->
        send sender, msg
    end
  end
end

pid1 = spawn(MySpawn, :receive_func, [])
pid2 = spawn(MySpawn, :receive_func, [])

send pid1, {self(), "fred"}
send pid2, {self(), "betty"}

receive do
  msg -> IO.puts msg
end

receive do
  msg -> IO.puts msg
end
