# Pipe Operator:
# The pipe operator |> passes the result of an expression as the first parameter of another expression.
IO.inspect "Elixir rocks" |> String.split()
IO.puts "elixir" |> String.ends_with?("ixir")