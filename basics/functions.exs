# Functions

# Anonymous Functions
sum = fn (a, b) -> a + b end
IO.puts sum.(2, 3)
# The & Shorthand: in the shorthand version our parameters are available to us as &1, &2, &3, and so on.
sum = &(&1 + &2)
IO.puts sum.(2, 3)
# Pattern Matching example

handle_result = fn
  {:ok, result} -> IO.puts "Handling result..."
  {:error} -> IO.puts "An error has occurred!"
end

some_result = 1
handle_result.({:ok, some_result})
handle_result.({:error})


# Named Functions
defmodule Greeter do
  def hello(name) do
    "Hello, " <> name
  end
end

IO.puts Greeter.hello("Sean") # -> "Hello, Sean"


# Recursion
defmodule Length do
  def of([]), do: 0
  def of([_ | tail]), do: 1 + of(tail)
end

IO.puts Length.of [] # -> 0
IO.puts Length.of [1, 2, 3] # -> 3

# Function Naming and Arity
defmodule Greeter2 do
  def hello(), do: "Hello, anonymous person!"   # hello/0
  def hello(name), do: "Hello, " <> name        # hello/1
  def hello(name1, name2), do: "Hello, #{name1} and #{name2}"
  # hello/2
end

IO.puts Greeter2.hello() # -> "Hello, anonymous person!"
IO.puts Greeter2.hello("Fred") # -> "Hello, Fred"
IO.puts Greeter2.hello("Fred", "Jane") # -> "Hello, Fred and Jane"

# Private Functions: Private functions can only be called from within their own Module.
# We define them in Elixir with defp
defmodule Greeter do
  def hello(name), do: phrase <> name
  defp phrase, do: "Hello, "
end

IO.puts Greeter.hello("Sean") # -> "Hello, Sean"
# IO.puts Greeter.phrase  # -> ** (UndefinedFunctionError) function Greeter.phrase/0 is undefined or private Greeter.phrase()

# In the following example we have two functions with the same signature, we rely on guards to determine which to use based on the argument’s type:
defmodule Greeter do
  def hello(names) when is_list(names) do
    names
    |> Enum.join(", ")
    |> hello
  end

  def hello(name) when is_binary(name) do
    phrase() <> name
  end

  defp phrase, do: "Hello, "
end

IO.puts Greeter.hello ["Sean", "Steve"] # -> "Hello, Sean, Steve"

# Default Arguments: If we want a default value for an argument we use the argument \\ value syntax:

defmodule Greeter do
  def hello(names, language_code \\ "en")

  def hello(names, language_code) when is_list(names) do
    names
    |> Enum.join(", ")
    |> hello(language_code)
  end

  def hello(name, language_code) when is_binary(name) do
    phrase(language_code) <> name
  end

  defp phrase("en"), do: "Hello, "
  defp phrase("es"), do: "Hola, "
end

IO.puts Greeter.hello ["Sean", "Steve"] # -> "Hello, Sean, Steve"
IO.puts Greeter.hello ["Sean", "Steve"], "es" # -> "Hola, Sean, Steve"