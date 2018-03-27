# Integers: Support for binary, octal, and hexadecimal numbers comes built in:
IO.puts 255
IO.puts 0b0110
IO.puts 0x1F

# Floats: They have 64-bit double precision and support e for exponent values:
IO.puts 3.14
IO.puts 1.0e-10

# Atoms: An atom is a constant whose name is its value(Ruby Symbols):
IO.puts :foo
IO.puts :foo == :bar

# Names of modules in Elixir are also atoms
IO.puts is_atom(MyApp.MyModule)

# String
IO.puts "hello world"
IO.puts String.length("The quick brown fox jumps over the lazy dog")
IO.puts "foo
...> bar"
# String Interpolation
name = "Interpolation"
IO.puts "Hello #{name}"
# String Concatenation
name = "Concatenation"
IO.puts "Hello " <> name

# Arithmetic
IO.puts 255 + 3
IO.puts 255 - 1
IO.puts 255 * 4
IO.puts 255 / 5

# Integer division or the division remainder
IO.puts div(10, 5)
IO.puts rem(10, 3)

# Elixir provides the ||, &&, and ! boolean operators
# Elixir comes with all the comparison operators we’re used to: ==, !=, ===, !==, <=, >=, <, and >