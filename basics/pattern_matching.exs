# Pattern Matching
key = "hello"

# The match operator performs assignment when the left side of the match includes a variable.
# In some cases this variable rebinding behavior is undesirable.
# For these situations we have the pin operator: ^.
IO.inspect %{^key => value} = %{"hello" => "world"}
IO.inspect value
# IO.inspect %{^key => value} = %{:hello => "world"} # -> ** (MatchError) no match of right hand side value: %{hello: "world"}

greeting = "Hello"

greet = fn
  (^greeting, name) -> "Hi #{name}"
  (greeting, name) -> "#{greeting}, #{name}"
end

IO.inspect greet.("Hello", "Sean")
IO.inspect greet.("Mornin'", "Sean")