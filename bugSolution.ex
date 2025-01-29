```elixir
list = [1, 2, 3, 4, 5]

# Solution 1: Using Task.async_stream for parallel processing
Enum.map(list, fn x ->
  Task.async(fn ->
    if x == 3 do
      Process.sleep(1000) # Simulate long-running operation
    end
    x
  end)
end) |> Enum.map(&Task.await/1) |> IO.inspect()

# Solution 2: Using Task.start within Enum.each for asynchronous operations
Enum.each(list, fn x ->
  Task.start(fn ->
    if x == 3 do
      Process.sleep(1000) # Simulate long-running operation
    end
    IO.puts(x)
  end)
end)
```