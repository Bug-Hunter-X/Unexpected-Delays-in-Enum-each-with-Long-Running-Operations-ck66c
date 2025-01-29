# Elixir Enum.each and Long-Running Operations

This example demonstrates a potential issue when using `Enum.each` in Elixir with a function that performs a long-running operation inside.  While `Enum.each` is convenient, it doesn't inherently handle concurrency well when individual iterations take a significant time.

**Problem:** The `Process.sleep` call simulates a time-consuming task.  If this were a network request or a complex computation, it would block subsequent iterations of the `Enum.each` loop, leading to unexpectedly slow execution and potential deadlocks if other processes rely on timely completion.

**Solution:** Use `Enum.map` and `Task.async_stream` for parallel processing or `Enum.each` with `Task.start` for asynchronous operations within the loop, ensuring better concurrency management.