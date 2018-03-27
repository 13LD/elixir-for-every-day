# Modules: Modules allow us to organize functions into a namespace
# In addition to grouping functions, they allow us to define named and private functions

defmodule Example do
  def greeting(name) do
    "Hello #{name}."
  end
end

IO.inspect Example.greeting "Sean" # -> "Hello Sean."


defmodule Example.Greetings do
  def morning(name) do
    "Good morning #{name}."
  end

  def evening(name) do
    "Good night #{name}."
  end
end

IO.inspect Example.Greetings.morning "Sean" # -> "Good morning Sean."


# Module Attributes: Module attributes are most commonly used as constants in Elixir. Let’s look at a simple example:
defmodule Example do
  @greeting "Hello"

  def greeting(name) do
    ~s(#{@greeting} #{name}.)
  end
end
# three most common reserved attributes are:
# moduledoc — Documents the current module.
# doc — Documentation for functions and macros.
# behaviour — Use an OTP or user-defined behaviour.

# Structs are special maps with a defined set of keys and default values
defmodule Example.User do
  defstruct name: "Sean", roles: []
end

IO.inspect %Example.User{} # -> %Example.User{name: "Sean", roles: []}

steve = %Example.User{name: "Steve", roles: [:admin, :owner]}
sean = %{steve | name: "Sean"} # -> %Example.User{name: "Sean", roles: [:admin, :owner]}

# Composition

# Alias: Allows us to alias module names; used quite frequently in Elixir code

# Import: If we want to import functions and macros rather than aliasing the module we can use import

# Require: Although used less frequently require/2 is nonetheless important.
# Requiring a module ensures that it is compiled and loaded.
# This is most useful when we need to access a module’s macros