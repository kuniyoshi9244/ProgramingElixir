defmodule FibSolver do

  def count(scheduler) do
    send scheduler, { :ready, self() }
    receive do
      { :count, filename, client } ->
        send client, { :answer, filename, count_cat(filename), self() }
        count(scheduler)
      { :shutdown } ->
        exit(:normal)
    end
  end

  # very inefficient, deliberately
  defp count_cat(filename) do
    {:ok, file} = File.read(filename)
    Regex.scan(~r{cat}, file) |> length
  end
end

defmodule Scheduler do

  def run(num_processes, module, func, to_calculate) do
    (1..num_processes)
    |> Enum.map(fn(_) -> spawn(module, func, [self()]) end)
    |> schedule_processes(to_calculate, [])
  end

  defp schedule_processes(processes, queue, results) do
    receive do 
      {:ready, pid} when length(queue) > 0 ->
        [ next | tail ] = queue
        send pid, {:count, next, self()}
        schedule_processes(processes, tail, results)

      {:ready, pid} ->
        send pid, {:shutdown}
        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), queue, results)
        else
          Enum.reduce(results, 0, fn ({_filename, result}, acc) -> result + acc end)
        end

      {:answer, filename, result, _pid} ->
        schedule_processes(processes, queue, [ {filename, result} | results ])
    end
  end
end

{:ok, current_dir} = File.cwd
file_dir = current_dir <> "/file/"
{:ok, file_dir_list} = File.ls(file_dir)
to_process = Enum.map(file_dir_list, fn elem -> file_dir <> elem end)

Enum.each 1..10, fn num_processes ->
  {time, result} = :timer.tc(
    Scheduler, :run,
    [num_processes, FibSolver, :count, to_process]
  )

  if num_processes == 1 do
    IO.puts inspect result
    IO.puts "\n #   time (s)"
  end
  :io.format "~2B     ~.2f~n", [num_processes, time/1000000.0]
end
