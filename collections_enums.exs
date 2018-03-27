# List
list = [3.14, :pie, "Apple"]
IO.puts "Lists \n"
Enum.each list, fn item ->
  IO.inspect item
end

# List operations
new_list = ["π"] ++ list ++ ["Cherry"] -- ["π", "Apple"]

Enum.each new_list, fn item ->
  IO.inspect item
end

# Head / Tail
head = hd [3.14, :pie, "Apple"] # -> 3.14
tail = tl [3.14, :pie, "Apple"] # -> [:pie, "Apple"]
IO.inspect head
IO.inspect tail
[head | tail] = [3.14, :pie, "Apple"] # -> the same as above


# Tuples
IO.puts "Tuple \n"

tuple = {3.14, :pie, "Apple"}



# Keyword lists: Keys are atoms; Keys are ordered; Keys may not be unique;
IO.puts "Keyword lists \n"

k_list = [foo: "bar", hello: "world"] # the same [{:foo, "bar"}, {:hello, "world"}]


# Maps: Unlike keyword lists, they allow keys of any type and are un-ordered
IO.puts "Maps \n"

map = %{:foo => "bar", "hello" => :world}

key = "hello"
IO.inspect %{key => "world"}

# If a duplicate is added to a map, it will replace the former value
duplicate = %{:foo => "bar", :foo => "hello world"}
IO.inspect duplicate

# Compare Keyword list and Map
IO.inspect %{foo: "bar", hello: "world"} == %{:foo => "bar", :hello => "world"}

# Update Maps
map = %{foo: "bar", hello: "world"}
IO.inspect %{map | foo: "baz"}

# Enum
# Enum methods

# Enum.__info__(:functions) |> Enum.each(fn({function, arity}) ->
#   IO.puts "#{function}/#{arity}"
# end)
IO.inspect Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 3 end) # -> false
IO.inspect Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) > 1 end) # -> true
IO.inspect Enum.any?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 5 end) # -> true
# chunk_every(enumerable, count, step, leftover \\ [])
IO.inspect Enum.chunk_every([1, 2, 3, 4, 5, 6], 2) # -> [[1, 2], [3, 4], [5, 6]]
IO.inspect Enum.chunk_by(["one", "two", "thre", "four", "five"], fn(x) -> String.length(x) end) # -> [["one", "two"], ["three"], ["four", "five"]]
IO.inspect Enum.chunk_by(["one", "two", "three", "four", "five", "six"], fn(x) -> String.length(x) end) # -> [["one", "two"], ["three"], ["four", "five"], ["six"]]
# map_every/3
IO.inspect Enum.map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn x -> x + 1000 end) # -> [1001, 2, 3, 1004, 5, 6, 1007, 8]
# Each
Enum.each(["one", "two", "three"], fn(s) -> IO.puts(s) end)
# Map
IO.inspect Enum.map([0, 1, 2, 3], fn(x) -> x - 1 end) # -> [-1, 0, 1, 2]
# Min / Max
IO.inspect Enum.min([5, 3, 0, -1]) # -> -1
IO.inspect Enum.max([5, 3, 0, -1]) # -> 5
# Filter
IO.inspect Enum.filter([1, 2, 3, 4], fn(x) -> rem(x, 2) == 0 end) # -> [2, 4]
# Sort
IO.inspect Enum.sort([5, 6, 1, 3, -1, 4]) # -> [-1, 1, 3, 4, 5, 6]
IO.inspect Enum.sort([:foo, "bar", Enum, -1, 4]) # -> [-1, 4, Enum, :foo, "bar"]
IO.inspect Enum.sort([%{:val => 4}, %{:val => 1}], fn(x, y) -> x[:val] > y[:val] end) # -> [%{val: 4}, %{val: 1}]
# Remove duplicates
IO.inspect Enum.uniq_by([1, 2, 3, 2, 1, 1, 1, 1, 1], fn x -> x end) # -> [1, 2, 3]
