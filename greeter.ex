defmodule Greeter do
  # Get name
  # Special greeting if name matches mine

  def greet do
    my_name = "DJ"
    their_name = IO.gets("What's your name?\n")
    if String.trim(their_name) == my_name do
      "🎉🎉🎉 That's my name!! 🎉🎉🎉"
    else
      "Nice to meet you #{their_name}!"
    end
  end
end
