alchemist.camp

## NOTES ##

Variables are defined like Ruby. Simply declare a name and set a value. 

An `atom` is a constant whose value is its own name. Some languages (e.g. Ruby) call these symbols. Atoms are equal if their names are equal. They are often used to express the state of an operation, by using values such as :ok or :error. The booleans `true` and `false` are atoms, and so is `nil`. These three atoms can all be called without the leading `:` that other atoms require.

`.ex` filetype is for *compiled* files
`.exs` filetype is for *interpreted* files (namely scripts/tests)

---
##Interactive Shell##

Start with `iex`
From within `iex`, you can load another elixir file with `Code.load_file(filename)`

---

##STRINGS##

Strings in Elixir are delimited by double quotes. It supports string interpolation like so
```
string = :world
"hello #{string}"
=> "hello world"
```

You can declare a string without quotes like this:
`~s{my text here}`

Similarly, regex is declared like:
`~r{my expression}`

Output a string or get user input as a string with:
`IO.puts("hi") => hi`
`IO.gets("prompt") => prints prompt, takes inputs`

Strings in Elixir are represented internally by binaries.

`is_binary("hello") => true`
`byte_size("hellö") => 6`

Byte size is not always indicative of length. The character ö takes 2 bytes to be represented in UTF-8.

The String module contains a lot of the functions that operate on strings.

`String.upcase("hello") -> "HELLO"`

---

##FUNCTIONS##

Functions in Elxir are defined by both their name and their arity (how many arguments they take).
`round/1` refers to a `round` function which takes `1` argument.

The Elixir shell defines the `h` function, which can be used to access documentation for any function.
`h round/1` will output the documentation for the `round/1` function.
`h` can be used to display documentation for any module and function that was compiled with docs.

**Anonymous functions** allow us to store and pass executable code around in a variable. They are delimited by the keywords `fn` and `end`:

```
fn x -> x * 2 end

add = fn a, b -> a + b end

add.(1, 2) => 3
is_function(add) => true
```

Arguments are always on the left side of the `->` and code to be executed on the right side.

Paranthesised arguments after an anonymous function (`add.(1, 2)` above) indicate that we want the function to be evaluated, not just its definition returned. A dot (`.`) between the variable and parentheses is required to invoke an anonymous function; this ensures there is no ambiguity between calling an anonymous function matched to a variable `add` and a named function `add/2`. Differences between anonymous and named functions will be expanded on later, but for now just remember that there is a clear distinction between them.

Anonymous functions in Elixir are also identified by the number of arguments they receive. We can check if a function is a given arity by using `is_function/2`

`is_function(add, 2) => true`
`is_function(add, 1) => false`

Anonymous functions are also closures and, as such, can access variables that are in scope when the function is defined. In this example we'll be using the anonymous `add` function we created previously.

```
double = fn a -> add.(a, a) end
double.(2)
=> 4
```

Lastly, a variable assigned inside a function will not affect its surrounding environment. In other words, variables are scoped by default.

```
x = 42
=> 42
(fn -> x = 0 end).()
=> 0
x
=> 42
```

---

`is_boolean(true) => true`
`is_boolean(1) => false`
`is_integer(x)`
`is_float(x)`
`is_number(x)`
`is_atom(x)`

---

`round(3.58) => 4`
`trunc(3.58) => 3`
`51/2 => 25.5`
`div 51/2 => 25`
`rem 51/2 => 1`
`min x, y => returns lowest of given arguments`

---

`|>` is called the **pipe operator**

`left |> right`
The pipe operator passes the expression on the left hand side as the first argument into the function call on the right-hand side.

---

`def guess(a, b) when a > b, do: guess(b, a)`
is equivalent to
```
def guess(a, b) when a > b do
  guess(b, a)
end
```
